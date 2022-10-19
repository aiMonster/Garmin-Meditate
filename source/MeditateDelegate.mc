import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Attention;
import Toybox.Timer;

class MeditateDelegate extends WatchUi.BehaviorDelegate {
    private static var LONG_DURATION = 1500;

    private var _view = getView();

    private var _inProgress = false;
    private var _currentDuration;
    private var _timer;

    function initialize() {
        BehaviorDelegate.initialize();
    }

    // On Menu click
    function onMenu() as Boolean {
        WatchUi.pushView(new MainMenu().getView(), new MainMenuViewDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

    // On Select button click
    function onSelect() as Boolean {
        if (_inProgress == false) {
            _inProgress = true;

            ActivityManager.startSession();
            
            startCountdown();
        }
        
        return true;
    }

    // On Back button click
    function onBack() as Boolean {
        ActivityManager.discardSession();

        return false;
    }

    // Starts countdown
    function startCountdown() {
        _currentDuration = DataManager.getDurationValue() * 60 - 1;

        callAttention(LONG_DURATION, true);

        _timer = new Timer.Timer();
        _timer.start(method(:updateCountdownValue), 1000, true);
    }

    function updateCountdownValue() {
        // If its the last tick
        if (_currentDuration == 0) {
            callAttention(LONG_DURATION, true);
            _view.setTimerValue(_currentDuration);

            _timer.stop();

            ActivityManager.stopSession();

            _inProgress = false;

            var completedView = new CompletedView();
            WatchUi.switchToView(completedView, new CompletedViewDelegate(completedView), WatchUi.SLIDE_UP);

            return;
        }

        _view.setTimerValue(_currentDuration);
        _currentDuration--;
    }

    // Calls an attention by vibration and backlight
    function callAttention(duration as Number, backlight as Boolean) as Void {
        var vibeData = [new Attention.VibeProfile(100, duration)];
        Attention.vibrate(vibeData);
        Attention.backlight(backlight);

        new Timer.Timer().start(method(:turnOffBacklight), 3000, false);
    }

    // Turns off backlight
    function turnOffBacklight() as Void {
        Attention.backlight(false);
    }
}