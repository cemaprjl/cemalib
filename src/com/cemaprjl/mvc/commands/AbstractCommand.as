package com.cemaprjl.mvc.commands
{
	import com.cemaprjl.mvc.controller.Core;

	/**
	 * @author cemaprjl
	 */
	public class AbstractCommand extends Core
	{
		
		private var _serviceName : String;

		public function AbstractCommand($serviceName : String)
		{
			_serviceName = $serviceName;
		}
		
		public function getCommandName() : String
		{
			return _serviceName;
		}
		
		public function execute($data : Object = null):void {
			trace(getCommandName() + ": This is default execute() method. Please override it.");
		}
		
	}
}
