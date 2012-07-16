package  {
	
	import flash.display.MovieClip;
    import flash.text.TextField;
    import flash.text.TextFieldAutoSize;	
	
	public class PopUp extends MovieClip 
	{
		private var _myCategory: String;
		private var _myInfo:XML;
		
		public function PopUp() 
		{

		}
		
		public function updateContent(category:String, info:XML) 
		{
			_myCategory = category;
			_myInfo = info;
			
			this.info.htmlText = "";
			this.title.htmlText = _myInfo.title[0].text();
			
			// show the category name on top:
			this.category.text = _myCategory;
						
			// loop through the titles if we have more than one and add a comma:
			for (var i:Number=1; i<Number(_myInfo.title.length()); i++){
				this.title.htmlText += (", " + _myInfo.title[i].text());
			}
			
			// popup values:
			if(_myInfo.popup.hasOwnProperty("multiLocationControl")){
				this.info.htmlText += "<b>Multi-Location Control:</b> " + _myInfo.popup.multiLocationControl + "<br /><br />";
			};

			if(_myInfo.popup.hasOwnProperty("comments")){
				this.info.htmlText +=  _myInfo.popup.comments + "<br /><br />";
			};
			
			if(_myInfo.popup.hasOwnProperty("wallplatesType")){ 
				this.info.htmlText += ("<b>Wallplate Type:</b> " + _myInfo.popup.wallplatesType + "<br /><br />");
			};
			
			if(_myInfo.popup.hasOwnProperty("deviceColors")){	
				// if we have only one deviceColors:
				if(_myInfo.popup.deviceColors.length() == 1){
					this.info.htmlText += ("<b>Device Colors: </b>" + _myInfo.popup.deviceColors + "<br /><br />");
				} else{
					this.info.htmlText += ("<b>Device Colors:</b><br />" + _myInfo.popup.deviceColors[0] + "<br />");
						// loop through the deviceColors if we have more than one and add a line break:
					for (var j:Number=1; j<Number(_myInfo.popup.deviceColors.length()); j++){
						this.info.htmlText += (_myInfo.popup.deviceColors[j].text() + "<br />");
					}	
					this.info.htmlText +=  "<br />";					
				}
			};
			
			if(_myInfo.popup.hasOwnProperty("neutralRequired")){
				this.info.htmlText += ("<b>Neutral Required:</b> " + _myInfo.popup.neutralRequired + "<br /><br />" );
			};
			
			if(_myInfo.popup.hasOwnProperty("colorKits")){
				this.info.htmlText += ("<b>Color Kits:</b> " + _myInfo.popup.colorKits + "<br /><br />" );				
			};
			
			if(_myInfo.popup.hasOwnProperty("kitColors")){
				this.info.htmlText += ("<b>Kit Colors:</b> " + _myInfo.popup.kitColors + "<br /><br />" );
			};
			
			if(_myInfo.popup.hasOwnProperty("buttonLabelKits")){
				this.info.htmlText += ("<b>Button Label Kits:</b> " + _myInfo.popup.buttonLabelKits + "<br /><br />" );
			};
			
			if(_myInfo.popup.hasOwnProperty("customEngravedButtons")){
				this.info.htmlText += ("<b>Custom Engraved Buttons:</b><br />" + _myInfo.popup.customEngravedButtons );
			};
			
			// if we have a copy node in the xml:
			if(_myInfo.popup.hasOwnProperty("copy")){			
				this.info.htmlText = _myInfo.popup.copy;
			}
			// if we have a star node inserted in productButton.as:
			if(_myInfo.popup.hasOwnProperty("star")){			
				this.info.htmlText = _myInfo.popup.star;
			}			
		}
		
	}
	
}
