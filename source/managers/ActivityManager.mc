import Toybox.Application;
import Toybox.ActivityRecording;

class ActivityManager {
    private static const SUB_SPORT_BREATHWORKS = 62;
    private static var _session as Session?;


    // Create and start new seesion
    static function startSession() as Void {
        _session = ActivityRecording.createSession({
            :name=>"Meditation", 
            :sport=>ActivityRecording.SPORT_TRAINING,
            :subSport => SUB_SPORT_BREATHWORKS
        });
        _session.start();
    }


    // Stop session
    static function stopSession() as Void {
        if(_session) {
            _session.stop();
        }
    }

    // Save session
    static function saveSession() as Void {
        if(_session) {
            _session.save();
            _session = null;
        }
    }

    // Discard session
    static function discardSession() as Void {
        if(_session) {
            _session.discard();
            _session = null;
        }
    }
}