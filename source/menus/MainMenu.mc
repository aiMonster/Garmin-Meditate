import Toybox.System;
import Toybox.WatchUi;

class MainMenu {
    private static var _menu;

    function initialize() {
        if(_menu == null) {
            setMenu();
        }
    }

    function getView() {
        return _menu;
    }

    function updateSublabel(id, value) {
        switch(id) {
            case "duration":
                _menu.getItem(0).setSubLabel(value.toString() + "min");
                break;
        }
    }

    private function setMenu() {
        _menu = new WatchUi.Menu2(null);

        var durationLbl = DataManager.getDurationValue().toString() + "min";
   
        _menu.addItem(new WatchUi.MenuItem("Duration", durationLbl, "duration", null));
    }
}