//
//  ContentView.swift
//  FocusBug
//
//  Created by Jason on 7/16/21.
//

import SwiftUI

struct ContentView: View {
    enum Field: Int, Hashable {
        case first, second
    }
    
    @State var text: String = ""
    @FocusState var focused: Field?
    
    var body: some View {
        VStack {
            Text("""
Instructions:
1. Click in the Foo text field, and observe the console prints "FOCUSBUG: change: Optional(FocusBug.ContentView.Field.first)". This is correct behavior.
2. Click in the Bar text field, and observe the console prints "FOCUSBUG: change: Optional(FocusBug.ContentView.Field.second)". This is correct behavior.
3. From either text field, hit TAB from the keyboard. Observe that the text field loses focus, but focus doesn't go to the other text field, and also there's no print statement for change in the focused value.
""")
            List {
                TextField("Foo", text: $text)
                    .onSubmit {
                        print("FOCUSBUG: submit foo")
                    }
                    .padding()
                    .focused($focused, equals: .first)
                
                TextField("Bar", text: $text)
                    .onSubmit {
                        print("FOCUSBUG: submit bar")
                    }
                    .padding()
                    .focused($focused, equals: .second)
                
                Button("Done") {
                    print("FOCUSBUG: done")
                }
            }
            .onChange(of: focused) { newValue in
                print("FOCUSBUG: change: \(newValue)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
