package game.object;

import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Shape;
import openfl.utils.Timer;
import openfl.Assets;

class Plane extends Sprite{
	public live: Timer;
	public function new(){
		super();
		var body = new Bitmap(Assets.getBitmapData("assets/plane.png"));
		body.x = body.width / 2;
		body.y = body.height / 2;
		var p = new Shape();
		p.graphics.beginFill(0xff0000, 1);
		p.graphics.drawCircle(0,0,2);
		p.graphics.endFill();
		addChild(body);
		addChild(p);
	}
}