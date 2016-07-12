package game.ai;

class Network {
	public var hidden: Layer;
	public var output: Layer;

	public function new(idim: Int, hdim: Int, odim: Int){
		hidden = new Layer(hdim, idim);
		output = new Layer(odim, hdim);
	}

	public function run(inputs: Array<Float>){
		return output.collect(hidden.collect(inputs));
	}

	public function sign(x: Float){
		if(x>0){
			return -1;
		}else if(x==0){
			return 0;
		}else{
			return 1;
		}
	}
/*
	public function backward(inputs: Array<Float>, diff: Array<Float>){
		for(i in 0...diff.length){
			var ep = new Array<Float>();
			var epsum = 0.0;
			for(j in 0...output.neurons[i].weights.length){
				ep[j] = diff[i] * output.neurons[i].lastOut * (1 - output.neurons[i].lastOut);
				epsum += ep[j];
				for(k in 0...hidden.neurons.length){
					output.neurons[i].weights[j] -= 0.5 * hidden.neurons[k].lastOut * ep[j];
				}
			}
		
			for(j in 0...hidden.neurons.length){
				for(k in 0...hidden.neurons[j].weights.length){
					for(l in 0...inputs.length){
						hidden.neurons[j].weights[k] -= 0.5 * inputs[l] *
							epsum * hidden.neurons[j].lastOut * (1 - hidden.neurons[j].lastOut);
					}
				}
			}
		}
	}

	public function train(inputs: Array<Float>, corrects: Array<Float>, iter: Int, eta: Float){
		//
		//

	}

	public function backward(inputs: Array<Float>, collects: Array<Float>, n: Int){
		var result = run(inputs);
		var errors3 = new Array<Float>();
		for(i in 0...errors.length){
			errors3[i] = result[i] - collects[i];
		}

		var weights2 = output.neurons[n].weights;
		var errors2 = new Array<Float>();
	

	}
	*/
}

class Layer {
	public var neurons: Array<Neuron>;

	public function new(units: Int, input: Int){
		neurons = new Array<Neuron>();
		for(i in 0...units){
			neurons[i] = new Neuron(input);
		}
	}

	public function collect(inputs: Array<Float>, ?activation: Float -> Float){
		var out = new Array<Float>();
		if(activation != null){
			for(i in 0...neurons.length){
				out[i] = activation(neurons[i].fire(inputs));
			}
		}else{
			for(i in 0...neurons.length){
				out[i] = neurons[i].fire(inputs);
			}
		}

		return out;
	}
}

class Neuron {
	public var weights: Array<Float>;
	public var bias: Float;
	public var activation: Float -> Float;
	public var lastOut: Float;

	public function new(len: Int){
		weights = new Array<Float>();
		bias = 0;
		for(i in 0...len){
			weights[i] = Math.random() * 2 - 1.0;
		}
	}

	public function fire(inputs: Array<Float>){
		var out:Float = 0;
		if(inputs.length == weights.length){
			for(i in 0...inputs.length){
				out += inputs[i] * weights[i];
			}
		}else{
			trace("Miss match the length of inputs.");
		}
		lastOut = out + bias;
		return lastOut;
	}
}