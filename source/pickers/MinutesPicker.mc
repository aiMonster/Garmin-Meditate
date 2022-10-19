import Toybox.Application.Storage;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

//! Picker that allows the user to choose a minutes count
class MinutesPicker extends WatchUi.Picker {
    //! Constructor
    public function initialize(
        titleText as String,
        initialValue as Number
    ) {
        var title = new WatchUi.Text({
            :text=>titleText,
            :color=>Graphics.COLOR_WHITE,
            :locX=>WatchUi.LAYOUT_HALIGN_CENTER,
            :locY=>WatchUi.LAYOUT_VALIGN_BOTTOM
        });
        
        var factories = [new MinutesPickerFactory(0, 99, 1)];
    
        var text = new WatchUi.Text({
            :text=> "min",
            :color=> Graphics.COLOR_WHITE,
            :locY=> WatchUi.LAYOUT_VALIGN_CENTER
        });

        Picker.initialize({
            :title=>title,
            :pattern=>factories,
            :defaults=>[initialValue],
            :confirm=>text
        });
    }

    //! Update the view
    //! @param dc Device Context
    public function onUpdate(dc as Dc) as Void {
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();
        Picker.onUpdate(dc);
    }
}

//! Responds to a time picker selection or cancellation
class MinutesPickerDelegate extends WatchUi.PickerDelegate {
    private var _callback;
    private var _callbackParams;

    //! Constructor
    public function initialize(callback as Method) {
        _callback = callback;
        // _callbackParams = callbackParams;

        PickerDelegate.initialize();
    }

    //! Handle a cancel event from the picker
    //! @return true if handled, false otherwise
    public function onCancel() as Boolean {
        WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
        return true;
    }

    //! Handle a confirm event from the picker
    //! @param values The values chosen in the picker
    //! @return true if handled, false otherwise
    public function onAccept(values as Array<Number?>) as Boolean {
        _callback.invoke(values[0]);
        WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
        return true;
    }
}
