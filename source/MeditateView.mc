import Toybox.Graphics;
import Toybox.WatchUi;

class MeditateView extends WatchUi.View {
    private var _currentTimerElement;

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));

        _currentTimerElement = findDrawableById("current_timer");
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
        setTimerValue(DataManager.getDurationValue() * 60);
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Updates timer value on the view
    function setTimerValue(seconds as Number) as Void {
        _currentTimerElement.setText(formatTime(seconds/60, seconds%60));

        WatchUi.requestUpdate();
    }

    function formatTime(minutes as Number, seconds as Number) as String {
        var secondsFormatted = seconds > 9 ? seconds.toString() : "0" + seconds.toString();
        return minutes.toString() + ":" + secondsFormatted;
    }
}
