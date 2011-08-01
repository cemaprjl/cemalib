package com.cemaprjl.mvc.controller
{
	import com.cemaprjl.mvc.commands.AbstractCommand;
	import flash.events.EventDispatcher;

	/**
	 * @author cemaprjl
	 */
	public class Controller extends EventDispatcher
	{
		private static var _instance : Controller;
		
		public static function getInstance():Controller {
			if(!_instance) {
				_instance = new Controller();
				Core.setController(_instance);
			}
			return _instance;
		}
		
		public function Controller()
		{
			super(this);
		}

		public function runCommand($class : Class, $data : Object = null) : void
		{
			if ($class != null)
			{
				var cmd : AbstractCommand = new $class();
				if (cmd != null)
				{
					cmd.execute($data);
				}
			}
		}
	}
}
