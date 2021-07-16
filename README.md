# FocusBug

Instructions:
1. Click in the Foo text field, and observe the console prints "FOCUSBUG: change: Optional(FocusBug.ContentView.Field.first)". This is correct behavior.
2. Click in the Bar text field, and observe the console prints "FOCUSBUG: change: Optional(FocusBug.ContentView.Field.second)". This is correct behavior.
3. From either text field, hit TAB from the keyboard. Observe that the text field loses focus, but focus doesn't go to the other text field, and also there's no print statement for change in the focused value.
