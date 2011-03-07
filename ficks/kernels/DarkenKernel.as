package ficks.kernels 
{
	import ficks.FICKSKernel;
	import ficks.FICKSManipulator;
	
	/**
	 * ...
	 * @author Richard Marks
	 */
	public class DarkenKernel extends FICKSKernel 
	{
		
		public function DarkenKernel() 
		{
			const factor:Number = 0.1234567;
			myKernelData.push(0, 1 * factor, 0, 1 * factor, 0, 1 * factor, 0, 1 * factor, 0);
		}
		
		override public function ProcessPixel(manipulator:FICKSManipulator):uint 
		{
			return ApplyKernel(3, 3, manipulator);
		}
	}

}