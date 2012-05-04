﻿package  {
	
	import flash.display.MovieClip;
	import flash.net.URLRequest;
    import flash.display.Loader;
	import flash.events.*;
	import flash.display.BlendMode;
	import flash.utils.Timer;
	import flash.utils.getTimer;
	import flash.events.TimerEvent;	
    import flash.text.TextLineMetrics;

	public class productButton extends MovieClip 
	{
		public var myProductXML:XML;
		public var category:String;
		
		private var hasPopup:Boolean = false;
		private var myTimer:Timer;
		
		public function productButton(product:XML) 
		{
			stop()
			myProductXML = product;
			addEventListener(Event.ADDED_TO_STAGE,init);
			// start timer:
			myTimer = new Timer(1000, 1); // 1 second
			myTimer.addEventListener(TimerEvent.TIMER, dispatchButtonEvent);
		}

		private function dispatchButtonEvent(e:TimerEvent):void
		{
			this.dispatchEvent(new Event("productButtonOver", true));			
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE,init);
			
			if(myProductXML.title == "star")
			{
				// old 
				/*
				var myStar:RedStar = new RedStar();
				myStar.x = 0;
				myStar.y = 110;
				addChild(myStar);
				//this.ID.text = "";
				*/
				
				this.ID.text = myProductXML.parent().@category;
				var myStar:RedStar = new RedStar();
				myStar.x = 57 + this.ID.textWidth/2;
				myStar.y = 110;
				addChild(myStar);	
			} 
			else 
			{
				// old
				// show the title
				//this.ID.text = myProductXML.title;	
				// show the category name:
				this.ID.text  = myProductXML.parent().@category;					
				// this product has a popup:
				hasPopup = true;
			}
			
			// load the image:
			loadImage(myProductXML.image);
			
			// get the category name:
			category = myProductXML.parent().@category;
		} 

		function loadImage(clip:String):void
		{
			var imageLoader:Loader = new Loader();
			var imageURL:String = "images/" + clip;
			var imageURLReq:URLRequest = new URLRequest(imageURL);
	
			this.addChild(imageLoader);
			this.useHandCursor = true;
			this.buttonMode = true;
			
			imageLoader.load(imageURLReq);
			imageLoader.contentLoaderInfo.addEventListener(Event.INIT, imageLoaded);
			imageLoader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, imageProgress);				
		}
		
		private function imageProgress (evt:ProgressEvent):void
		{
			//trace(Math.round((evt.bytesLoaded / evt.bytesTotal)*100));
		}

		function imageLoaded(evt:Event):void 
		{
			var targetLoader:Loader = Loader(evt.target.loader);
			targetLoader.x = 35;
			targetLoader.y = 25;			
			targetLoader.blendMode = BlendMode.DARKEN;

			targetLoader.addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
			targetLoader.addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
			targetLoader.addEventListener(MouseEvent.CLICK, mouseClickHandler);		
		}
		
		private function mouseClickHandler(e:MouseEvent):void
		{
			// move the product button on top of display list:
			var maxIndex:Number = this.parent.numChildren-1;
			parent.setChildIndex(this, maxIndex);		
			
			// if this product has a popup, show it:
			if(hasPopup) 
			{
				this.dispatchEvent(new Event("productButtonOver", true));
				myTimer.stop();
			}			
		}
		
		private function mouseOverHandler(e:MouseEvent):void
		{
			this.nextFrame();	
			// start the timer:
			if(hasPopup) 
			{	
				myTimer.start();
			}
		}

		private function mouseOutHandler(e:MouseEvent):void
		{
			this.prevFrame();	
			myTimer.stop();
			this.dispatchEvent(new Event("productButtonOut", true));
		}		
		
		
	}
}

