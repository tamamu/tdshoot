package game.ai;

import haxe.ds.Vector;
typedef FVector = Vector<Float>;
typedef FMatrix = Vector<Vector<Float>>;

class Mop {
	static public function outer(x: FVector, y: FVector): FMatrix {
		var z: FMatrix = new Vector(x.length);
		for(i in 0...z.length){
			z[i] = new Vector(y.length);
			for(j in 0...y.length){
				z[i][j] = x[i] * y[j];
			}
		}
		return z;
	}

	static public function affine(x: FVector, w: FMatrix, b: FVector): FVector{
		var y = new Vector(w.length);
		var ww = w[0].length;
		var wh = w.length;
		for(i in 0...wh){
			var t = 0.0;
			for(j in 0...ww){
				t += w[i][j] * x[j];
			}
			y[i] = t;
		}
		return y;
	}
}