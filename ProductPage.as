﻿package  {
	
	import flash.display.MovieClip;
	import flash.events.*;
	import fl.containers.ScrollPane;
	
	import org.casalib.*;
	import org.casalib.layout.Distribution;
	
	public class ProductPage extends MovieClip {
				
		public function ProductPage(type:String, _xml:XML) 
		{
			var dist:Distribution = new Distribution(400);
			dist.y = 150;
			dist.setMargin(0, 2, 5, 2);
			this.addChild(dist);

			// select all products by type on this page:			
			var productsPerPage:XMLList =  _xml.tabs.tab.products.productCategory.product.(@type == type);
			
			// create products for this page:	
			for (var i:Number=0; i<productsPerPage.length(); i++)
			{
				var currentProduct:XML = productsPerPage[i];
				// create the product button:
				var myProduct:productButton = new productButton(currentProduct);
				// add to distribution:
				dist.addChildWithDimensions(myProduct,119,153);
				// check if we have a star, show the starFooter:
				if(productsPerPage[i].title == "star" && !starCreated)
				{
					// create the starFooter once:
					var starFooter:StarFooter = new StarFooter();
					this.addChild(starFooter);	
					var starCreated:Boolean = true;
				}
			}
			
			dist.position();
						
			// add scrollPane:
			if (this.height > 300) 
			{ 
				var myScrollPane:ScrollPane = new ScrollPane();
				myScrollPane.scrollDrag = true;
				myScrollPane.source = dist;
				myScrollPane.y = 150;
				myScrollPane.width = 390;
				myScrollPane.height = 770; //730
				this.addChild(myScrollPane);
			}
			
		}
	}
}