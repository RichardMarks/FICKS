package ficks 
{
	import flash.display.BitmapData;
	/**
	 * Flash Image Convolution Kernel System
	 * 
	 * @author Richard Marks
	 */
	public class FICKSManipulator 
	{
		protected var mySource:BitmapData;
		protected var myDest:BitmapData;
		protected var myPosX:int;
		protected var myPosY:int;
		protected var myWidth:int;
		protected var myHeight:int;
		
		public function FICKSManipulator() 
		{
			
		}
		
		public function Process(
			source:BitmapData, 
			dest:BitmapData, 
			kernel:FICKSKernel,
			modRed:Boolean = true, modGreen:Boolean = true, modBlue:Boolean = true, modAlpha:Boolean = false):Boolean
		{
			mySource = source;
			myDest = dest;
			myWidth = source.width;
			myHeight = source.height;
			try
			{
				for (myPosY = 0; myPosY < myHeight; myPosY++)
				{
					for (myPosX = 0; myPosX < myWidth; myPosX++)
					{
						WriteRelativePixel(kernel.ProcessPixel(this), modRed, modGreen, modBlue, modAlpha);
					}
				}
			}
			catch (e:Error)
			{
				trace("FICKSManipulator.Process() Error\n", e.message);
				return false;
			}
			
			return true;
		}
		
		public function ReadRelativePixel(x:int, y:int):uint
		{
			return mySource.getPixel32(myPosX + x, myPosY + y);
		}
		
		protected function WriteRelativePixel(color:uint, modRed:Boolean, modGreen:Boolean, modBlue:Boolean, modAlpha:Boolean):void
		{
			
			var pixelColor:uint = 0x00000000;
			if (modRed) { pixelColor |= ((color >> 16 & 0xFF) << 16);  } //else {pixelColor |= 0 << 16;}
			if (modGreen) { pixelColor |= ((color >> 8 & 0xFF) << 8); }//else {pixelColor |= 0 << 8;}
			if (modBlue) { pixelColor |= (color & 0xFF); }//else {pixelColor |= 0 ;}
			if (modAlpha) { pixelColor |= ((color >> 24 & 0xFF) << 24); }//else {pixelColor |= 0 << 24;}
			
			myDest.setPixel32(myPosX, myPosY, pixelColor);
		}
	}
}