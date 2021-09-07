//
//  ContentView.swift
//  WeSplit
//
//  Created by Leopold on 7/9/21.
//

import SwiftUI

struct ContentView: View {
    // @State allows us to work around the limitation of structs
    // @State is specifically designed for simple properties that are stored in one view. As a result, Apple recommends we add private access control to those properties.
    @State private var tapCount = 0
    @State private var description = ""

    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = 0
    
    var body: some View {
        NavigationView {
            Form {
                // can only take up to 10 children!
                // unless with a Group
                // Or use Section
                
                Section {
                    // We don't need two way binding here
                    Text("Tap for \(description): \(tapCount)")
                }

                Section {
                    // Two way binding here
                    TextField("Enter the description: ", text: $description)
                        .keyboardType(.twitter)
                    Button("Tap to increase") {
                        self.tapCount += 1
                    }
                }

                Section {
                    Text("You chose: Student # \(students[selectedStudent])")
                    Picker("Select your student", selection: $selectedStudent) {
                        ForEach(0 ..< students.count) {
                            Text(self.students[$0])
                        }
                    }
                }
            }
            .navigationBarTitle(Text("💳 WeSplit"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
