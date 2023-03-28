import Toybox.WatchUi;

class MainMenuViewDelegate extends WatchUi.Menu2InputDelegate {
    private var _mainMenuView;

    // Constructor
    function initialize() {
        _mainMenuView = new MainMenu();
        Menu2InputDelegate.initialize();
    }

    // On Select button clicked
    function onSelect(item as MenuItem) as Void {
        var id = item.getId().toString();

        if (id.equals("duration")) {
            var initialValue = DataManager.getDurationValue();
            var callback = method(:updateDurationSettings);

            var picker = new MinutesPicker("Duration", initialValue);
            var delegate = new MinutesPickerDelegate(callback);

            WatchUi.pushView(picker, delegate, WatchUi.SLIDE_IMMEDIATE);
        }
    }

    function updateDurationSettings(value) as Void {
        _mainMenuView.updateSublabel("duration", value);
        DataManager.setDurationValue(value);
    }
}