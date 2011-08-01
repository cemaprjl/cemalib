package com.cemaprjl.utils
{

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.Dictionary;

	public class Utils
	{
		// plays the movie clip once and then calls callback
		static public function playOnce($movieClip : MovieClip, $callBack : Function = null) : void
		{
			_playOnceCallBackDictionary[$movieClip] = $callBack;

			$movieClip.addEventListener(Event.ENTER_FRAME, onPlayOnceEnterFrame);
			$movieClip.gotoAndPlay(1);
		}

		static private function onPlayOnceEnterFrame($event : Event) : void
		{
			var movieClip : MovieClip = $event.currentTarget as MovieClip;
			if ( movieClip.currentFrame == movieClip.totalFrames )
			{
				movieClip.stop();
				movieClip.removeEventListener(Event.ENTER_FRAME, onPlayOnceEnterFrame);
				var callBack : Function = _playOnceCallBackDictionary[movieClip];
				delete _playOnceCallBackDictionary[movieClip];
				if ( callBack != null )
					callBack(movieClip);
			}
		}

		static private var _playOnceCallBackDictionary : Dictionary = new Dictionary();

		static public function millisecondsToFormattedTime1($milliseconds : Number) : String
		{
			var string : String;
			var msInDay : Number = 86400000;
			var days : Number = Math.round($milliseconds / msInDay);

			var date : Date = new Date();
			date.setTime($milliseconds);
			var hours : String = addLeadingZero(date.getMinutes());
			var mins : String = addLeadingZero(date.getMinutes());
			var seconds : String = addLeadingZero(date.getSeconds());
			if (days > 0)
			{
				string = days + ":" + hours + ":" + mins + ":" + seconds;
			}
			else if (Number(hours) > 0)
			{
				string = hours + ":" + mins + ":" + seconds;
			}
			else
			{
				string = mins + ":" + seconds;
			}
			return string;
		}

		static private function addLeadingZero($value : Number) : String
		{
			var string : String = $value.toString();

			if (string.length == 1)
				string = "0" + string;

			return string;
		}

		// keys are MovieClip, values are Function
		static public function millisecondsToFormattedTime($milliseconds : Number) : String
		{
			var string : String;


//			var dayUnit : String = gameLocalization.getString(["common", "day"]);
//			var hourUnit : String = gameLocalization.getString(["common", "hour"]);
//			var minuteUnit : String = gameLocalization.getString(["common", "minute"]);
//			var secondUnit : String = gameLocalization.getString(["common", "second"]);

			var days : int = $milliseconds / (1000 * 60 * 60 * 24);
			$milliseconds -= days * (1000 * 60 * 60 * 24);

			var hours : int = $milliseconds / (1000 * 60 * 60);
			$milliseconds -= hours * (1000 * 60 * 60);

			var minutes : int = $milliseconds / (1000 * 60);
			$milliseconds -= minutes * (1000 * 60);

			var seconds : int = $milliseconds / 1000;

//			var daysString : String = days.toString() + dayUnit;
//
//			var hoursString : String = hours.toString() + hourUnit;
//
//			var minutesString : String = minutes.toString() + minuteUnit;
//
//			var secondsString : String = seconds.toString() + secondUnit;

//			if ( days > 0 )
//			{
//				if ( minutes > 0 )
//					string = daysString + " " + hoursString + " " + minutesString;
//				else if ( hours > 0 )
//					string = daysString + " " + hoursString;
//				else
//					string = daysString;
//			}
//			else if ( hours > 0 )
//			{
//				if ( minutes > 0 )
//					string = hoursString + " " + minutesString;
//				else
//					string = hoursString;
//			}
//			else
//			{
//				string = minutesString;
//			}

			return string;
		}

		static public function secondsToFormattedTime($seconds : Number) : String
		{
			var string : String;

//			var gameLocalization : GameLocalization = Facade.gameLocalization;

//			var dayUnit : String = gameLocalization.getString(["common", "day"]);
//			var hourUnit : String = gameLocalization.getString(["common", "hour"]);
//			var minuteUnit : String = gameLocalization.getString(["common", "minute"]);
//			var secondUnit : String = gameLocalization.getString(["common", "second"]);

			var days : int = $seconds / (60 * 60 * 24);
			$seconds -= days * (60 * 60 * 24);

			var hours : int = $seconds / (60 * 60);
			$seconds -= hours * (60 * 60);

			var minutes : int = $seconds / (60);
			$seconds -= minutes * (60);

			var seconds : int = $seconds;

//			var daysString : String = days.toString() + dayUnit;
//
//			var hoursString : String = hours.toString() + hourUnit;
//
//			var minutesString : String = minutes.toString() + minuteUnit;
//
//			var secondsString : String = seconds.toString() + secondUnit;

//			if ( days > 0 )
//			{
//				if ( minutes > 0 )
//					string = daysString + " " + hoursString + " " + minutesString;
//				else if ( hours > 0 )
//					string = daysString + " " + hoursString;
//				else
//					string = daysString;
//			}
//			else if ( hours > 0 )
//			{
//				if ( minutes > 0 )
//					string = hoursString + " " + minutesString;
//				else
//					string = hoursString;
//			}
//			else
//			{
//				string = minutesString;
//			}

			return string;
		}

		public static function secondsToFormattedTimeWS($seconds : Number) : String
		{
			var string : String;

//			var gameLocalization : GameLocalization = Facade.gameLocalization;
//
//			var dayUnit : String = gameLocalization.getString(["common", "day"]);
//			var hourUnit : String = gameLocalization.getString(["common", "hour"]);
//			var minuteUnit : String = gameLocalization.getString(["common", "minute"]);
//			var secondUnit : String = gameLocalization.getString(["common", "second"]);
//
//			var days : int = $seconds / (60 * 60 * 24);
//			$seconds -= days * (60 * 60 * 24);
//
//			var hours : int = $seconds / (60 * 60);
//			$seconds -= hours * (60 * 60);
//
//			var minutes : int = $seconds / (60);
//			$seconds -= minutes * (60);
//
//			var seconds : int = $seconds;
//
//			var daysString : String = days.toString() + dayUnit;
//
//			var hoursString : String = hours.toString() + hourUnit;
//
//			var minutesString : String = minutes.toString() + minuteUnit;
//
//			var secondsString : String = seconds.toString() + secondUnit;
//
//			if ( days > 0 )
//			{
//				if ( minutes > 0 )
//					string = daysString + " " + hoursString + " " + minutesString + " " + secondsString;
//				else if ( hours > 0 )
//					string = daysString + " " + hoursString;
//				else
//					string = daysString;
//			}
//			else if ( hours > 0 )
//			{
//				if ( minutes > 0 )
//					string = hoursString + " " + minutesString + " " + secondsString;
//				else
//					string = hoursString;
//			}
//			else
//			{
//				string = minutesString + " " + secondsString;
//			}

			

			return string;
		}
	}
}