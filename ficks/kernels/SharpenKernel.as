package ficks.kernels 
{
	import ficks.FICKSKernel;
	import ficks.FICKSManipulator;
	
	/**
	 * Flash Image Convolution Kernel System
	 * 
	 * @author Richard Marks
	 */
	public class SharpenKernel extends FICKSKernel 
	{
		
		public function SharpenKernel() 
		{
			for (var i:int = 0; i < 9; i++)
			{
				myKernelData.push(-1.0);
			}
			myKernelData[4] = 9.0;
		}
		
		override public function ProcessPixel(manipulator:FICKSManipulator):uint 
		{
			return ApplyKernel(3, 3, manipulator);
		}
	}

}