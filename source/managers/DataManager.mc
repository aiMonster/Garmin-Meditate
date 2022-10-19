import Toybox.Application;

class DataManager {
    static function getDurationValue() {
        return Application.Properties.getValue("duration");
    }

    static function setDurationValue(duration) {
        Application.Properties.setValue("duration", duration);
    }
}
