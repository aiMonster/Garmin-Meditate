import Toybox.WatchUi;

class CompletedViewDelegate extends WatchUi.BehaviorDelegate {
    private var _saveSelected = true;
    private var _view as CompletedView?;

    // Constructor
    function initialize(view as CompletedView) {
        _view = view;
        BehaviorDelegate.initialize();
    }

    // On Select button click
    function onSelect() {
        handleSession();
        
        WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
        
        return true;
    }

    // On Down button click
    function onNextPage() {
        updateActiveAction();
    }

    // On Up button click
    function onPreviousPage() {
        updateActiveAction();
    }

    // Handle recorded session
    function handleSession() as Void {
        if (_saveSelected) {
            ActivityManager.saveSession();
        } else {
            ActivityManager.discardSession();
        }
    }

    // Update selected action for recorded activity
    function updateActiveAction() as Void {
        _saveSelected = !_saveSelected;
        _view.setSaveAsActiveAction(_saveSelected);
    }
}