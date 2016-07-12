package;

import haxe.ds.Vector;
import openfl.display.Sprite;
import game.ai.Network;
import game.ai.Mop;

class Main extends Sprite {
	
	static function vector(data: Array<Float>) {
		return Vector.fromArrayCopy(data);
	}
	
	public function new () {
		
		super ();
		
		var nn = new Network(2, 4, 2);
		//nn.train([0.3, 0.5], [1, -1], 10000);
		trace(Mop.outer(vector([1.0,2.0,3.0]), vector([4.0,5.0,6.0])));
		
	}
	
	
}