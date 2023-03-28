import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class MeditateApp extends Application.AppBase {
    private var _view;

    function initialize() {
        AppBase.initialize();
    }

    // Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
        _view = new MeditateView();

        return [_view, new MeditateDelegate() ] as Array<Views or InputDelegates>;
    }

    // Returns main view instance
    function getView() as Void {
        return _view;
    }
}

// Returns application instance
function getApp() as MeditateApp {
    return Application.getApp() as MeditateApp;
}

// Returns main view instance
function getView() {
    return Application.getApp().getView();
}
