﻿package  {		import flash.display.MovieClip;    import flash.text.TextField;    import flash.text.TextFieldAutoSize;			public class PopUp extends MovieClip 	{		private var _myCategory: String;		private var _myInfo:XML;				public function PopUp() 		{		}				public function updateContent(category:String, info:XML) 		{			_myCategory = category;			_myInfo = info;			this.category.text = _myCategory;			this.title.text = _myInfo.title;			this.info.htmlText = "";			// if we have regular info text:/*			if(_myInfo.popup.multiLocationControl != ""){				this.info.htmlText = "Multi-Location Control: " + _myInfo.popup.multiLocationControl + "<br /><br />Wallplate Type: " 			+ _myInfo.popup.wallplatesType + "<br /><br />Colors: " + _myInfo.popup.deviceColors + "<br /><br />Neutral Required: " + _myInfo.popup.neutralRequired			 + "<br /><br />Color Kits: " + _myInfo.popup.colorKits + "<br /><br />Kit Colors: " + _myInfo.popup.kitColors;			} else */					if(_myInfo.popup.hasOwnProperty("multiLocationControl")){				this.info.htmlText += "<b>Multi-Location Control:</b> " + _myInfo.popup.multiLocationControl + "<br /><br />";			};						if(_myInfo.popup.hasOwnProperty("wallplatesType")){ 				this.info.htmlText += ("<b>Wallplate Type:</b> " + _myInfo.popup.wallplatesType + "<br /><br />");			};						if(_myInfo.popup.hasOwnProperty("deviceColors")){				this.info.htmlText += ("<b>deviceColors:</b> " + _myInfo.popup.deviceColors + "<br /><br />");			};						if(_myInfo.popup.hasOwnProperty("neutralRequired")){				this.info.htmlText += ("<b>Neutral Required:</b> " + _myInfo.popup.neutralRequired + "<br /><br />");			};			if(_myInfo.popup.hasOwnProperty("colorKits")){				this.info.htmlText += ("<b>Color Kits:</b> " + _myInfo.popup.colorKits + "<br /><br />");							};						if(_myInfo.popup.hasOwnProperty("kitColors")){				this.info.htmlText += ("<b>Kit Colors:</b> " + _myInfo.popup.kitColors );			};						if(_myInfo.popup.hasOwnProperty("copy")){							this.info.htmlText = _myInfo.popup.copy;			}		}			}	}