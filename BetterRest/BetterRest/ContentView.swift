//
//  ContentView.swift
//  BetterRest
//
//  Created by Leopold on 17/9/21.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmout = 8.0
    @State private var wakeUP = defaultWakeTime
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    @State private var showingHero = false
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("When do you want to wake up?")) {
                    DatePicker("Enter Time", selection: $wakeUP, displayedComponents: .hourAndMinute)
                        .datePickerStyle(WheelDatePickerStyle())
                }
                
                Section (header: Text("Desired Amount of sleep")) {
                    Stepper(value: $sleepAmout, in: 4...12, step: 0.25) {
                        Text("\(sleepAmout, specifier: "%g") hours")
                    }
                }
                
                Section (header: Text("Daily coffee intake")) {
                    Stepper(value: $coffeeAmount, in: 0...20) {
                        Text("\(coffeeAmount) cup\(coffeeAmount == 0 || coffeeAmount == 1 ? "" : "s")")
                    }
                    Picker("Number of cups", selection: $coffeeAmount) {
                            ForEach(0 ..< 21) {
                                Text("\($0) cup\($0 == 0 || $0 == 1 ? "" : "s")")
                            }
                        }
                    .pickerStyle(.wheel)
                }
                
                if showingHero {
                    Section(header: Text(alertTitle)) {
                        HStack {
                            Spacer()
                            Text(calculateBedtime())
                                .font(.largeTitle)
                            Spacer()
                        }
                    }
                }

            }
            .navigationTitle("😴 BetterRest")
/// @Deprecated
//            .navigationBarItems(trailing:
//                                    Button(action: calculateBedtime, label: {
//                                        Text("Calculate")
//                                    })
//            )
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        showingHero.toggle()
                        _ = calculateBedtime()
                    }, label: {
                        Text("\(showingHero ? "Hide" : "Show")")
                    })
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: alertBedtime, label: {
                        Text("Calculate")
                    })
                }
            }
            .alert(isPresented: $showingAlert, content: {
                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            })
        }
    }
    
    func calculateBedtime() -> String {
        let model = SleepCalculator()
        
        // Convert Date instance to seconds
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUP)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        
        do {
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmout, coffee: Double(coffeeAmount))
            
            //  you can subtract a value in seconds directly from a Date, and you’ll get back a new Date!
            let sleeptime = wakeUP - prediction.actualSleep
            
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            
            alertTitle = "Your Ideal Bedtime"
            alertMessage = formatter.string(from: sleeptime)
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
        
        return alertMessage
    }
    
    func alertBedtime() {
        _ = calculateBedtime()
        showingAlert = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
