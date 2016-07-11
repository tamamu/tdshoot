package;


import openfl.display.Sprite;
import game.ai.Network;

class Main extends Sprite {
	
	
	public function new () {
		
		super ();
		
		var nn = new Network(2, 4, 2);
		//nn.train([0.3, 0.5], [1, -1], 10000);
		
		
	}
	
	
}