package ficks 
{
	/**
	 * Flash Image Convolution Kernel System
	 * 
	 * @author Richard Marks
	 */
	public class FICKSKernel 
	{
		protected var myKernelData:Vector.<Number> = new Vector.<Number>();
		protected var myWidth:int;
		protected var myHeight:int;
		
		public function FICKSKernel() {}
		
		public function ProcessPixel(manipulator:FICKSManipulator):uint
		{
			return 0x00000000;
		}
		
		protected function ApplyKernel(kernelWidth:int, kernelHeight:int, manipulator:FICKSManipulator):uint
		{
			/*
			var finalColor:uint;
			var inverseKernelWidthOver2:int = int(-(kernelWidth * 0.5));
			var inverseKernelHeightOver2:int = int(-(kernelHeight * 0.5));
			var i:int = 0;
			
			var pixelColor:uint, pixelColorT:uint, k:Number;
			
			for (var y:int = 0; y < kernelHeight; y++)
			{
				for (var x:int = 0; x < kernelWidth; x++)
				{
					pixelColor = manipulator.ReadRelativePixel(inverseKernelWidthOver2 + x, inverseKernelHeightOver2 + y);
					k = myKernelData[i];
					
					pixelColorT = 
					(((pixelColor >> 24 & 0xFF) * k) << 24) | 
					(((pixelColor >> 16 & 0xFF) * k) << 16) |
					(((pixelColor >> 8 & 0xFF) * k) << 8) | 
					((pixelColor & 0xFF) * k);
					
					finalColor += pixelColorT;
					i++;
				}
			}
			
			return finalColor;
			*/
			
			var kernelSum:int;
			var colorSumR:uint;
			var colorSumG:uint;
			var colorSumB:uint;
			var colorSumA:uint;
			
			var inverseKernelWidthOver2:int = int(-(kernelWidth * 0.5));
			var inverseKernelHeightOver2:int = int(-(kernelHeight * 0.5));
			var i:int = 0;
			
			var pixelColor:uint, k:Number;
			
			for (var y:int = 0; y < kernelHeight; y++)
			{
				for (var x:int = 0; x < kernelWidth; x++)
				{
					pixelColor = manipulator.ReadRelativePixel(inverseKernelWidthOver2 + x, inverseKernelHeightOver2 + y);
					k = myKernelData[i];
					
					kernelSum += k;
					colorSumA += (pixelColor >> 24 & 0xFF) * k;
					colorSumR += (pixelColor >> 16 & 0xFF) * k;
					colorSumG += (pixelColor >> 8 & 0xFF) * k;
					colorSumB += (pixelColor & 0xFF) * k;
					
					i++;
				}
			}
			
			if (kernelSum > 0)
			{
				colorSumA /= kernelSum;
				colorSumR /= kernelSum;
				colorSumG /= kernelSum;
				colorSumB /= kernelSum;
				
				colorSumA = Math.max(0, Math.min(255, colorSumA));
				colorSumR = Math.max(0, Math.min(255, colorSumR));
				colorSumG = Math.max(0, Math.min(255, colorSumG));
				colorSumB = Math.max(0, Math.min(255, colorSumB));
				
				return ((colorSumA << 24) |  ( colorSumR << 16) | (colorSumG << 8) | colorSumB);
			}
			else
			{
				
				colorSumA = Math.max(0, Math.min(255, colorSumA));
				colorSumR = Math.max(0, Math.min(255, colorSumR));
				colorSumG = Math.max(0, Math.min(255, colorSumG));
				colorSumB = Math.max(0, Math.min(255, colorSumB));
				
				return ((colorSumA << 24) |  ( colorSumR << 16) | (colorSumG << 8) | colorSumB);
			}
		}
	}
}