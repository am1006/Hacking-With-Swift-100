//
//  ContentView.swift
//  BetterRest
//
//  Created by Leopold on 17/9/21.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmout = 8.0
    @State private var wakeUP = Date()
    
    var body: some View {
        NavigationView {
            Form {
                DatePicker("Please enter a date", selection: $wakeUP, displayedComponents: .hourAndMinute, in: Date()...)
                    .labelsHidden()
                
                Stepper(value: $sleepAmout, in: 4...12, step: 0.25) {
                    Text("\(sleepAmout, specifier: "%g") hours")
                }
            }
            .navigationTitle("😴 BetterRest")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
