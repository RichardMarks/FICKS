package ficks.kernels 
{
	import ficks.FICKSKernel;
	import ficks.FICKSManipulator;
	
	/**
	 * Flash Image Convolution Kernel System
	 * 
	 * @author Richard Marks
	 */
	public class BlurKernel extends FICKSKernel 
	{
		public function BlurKernel() 
		{
			for (var i:int = 0; i < 9; i++)
			{
				myKernelData.push(1.0 / 9.0);
			}
		}
		
		override public function ProcessPixel(manipulator:FICKSManipulator):uint 
		{
			return ApplyKernel(3, 3, manipulator);
		}
	}

}