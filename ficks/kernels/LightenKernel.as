package ficks.kernels 
{
	import ficks.FICKSKernel;
	import ficks.FICKSManipulator;
	
	/**
	 * ...
	 * @author Richard Marks
	 */
	public class LightenKernel extends FICKSKernel 
	{
		public function LightenKernel() 
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