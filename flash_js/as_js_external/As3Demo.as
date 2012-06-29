package {	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.external.ExternalInterface;
	import flash.text.TextField;

	public class As3Demo extends Sprite
	{
		private var btn:Sprite;
		private var input:TextField;
		private var txtarea:TextField;
		public function As3Demo()
		{
            //var socket:CustomSocket = new CustomSocket("localhost", 8080);
//			var _mcreat:Sprite = new Sprite();
//			_mcreat.graphics.beginFill(0x0000ff);
//			_mcreat.graphics.drawCircle(100,100,50);
//			_mcreat.graphics.endFill();
//			this.addChild(_mcreat);
			//var test:DataGrid_ShowData_Example = new DataGrid_ShowData_Example();
			//this.addChild(test);
			init();
		}
		private function init():void{
		    ExternalInterface.addCallback("actionScriptSay", actionScriptSay);
			btn = new Sprite();
			btn.buttonMode = true;
			btn.graphics.beginFill(0xff00ff,0.85);
			btn.graphics.drawRect(250,50,100,20);
			btn.graphics.endFill();
			this.addChild(btn);
			btn.addEventListener(MouseEvent.CLICK,onClick);
			
			input = new TextField();
			this.addChild(input);
			input.x = 50;
			input.y = 50;
			input.width = 150;
			input.height = 25;
			input.border = true;
			input.background = true;
			input.multiline = false;
			input.focusRect = true;
			input.backgroundColor = 0xffffff;
			input.text = 'The msg from actionScript3.0!';
			
			txtarea = new TextField();
			this.addChild(txtarea);
			txtarea.x = 50;
			txtarea.y = 100;
			txtarea.width = 300;
			txtarea.height = 100;
			txtarea.multiline = true;
			txtarea.border = true;
			txtarea.background = true;
			txtarea.backgroundColor = 0xffffff;
		}
		
		private function onClick(evt:MouseEvent):void{
		    ExternalInterface.call("javascritpSay",input.text);
		}
		
		private function actionScriptSay(value:String):String{
		
		    txtarea.text=txtarea.text+"JavascritpSay says: " + value + "\n";
			return txtarea.text;
		}
	}
}
