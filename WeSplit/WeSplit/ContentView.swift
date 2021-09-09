//
//  ContentView.swift
//  WeSplit
//
//  Created by Leopold on 7/9/21.
//

import SwiftUI

struct ContentView: View {
    // Swift UI must use strings to store text field values
    @State private var checkAmount = ""
    @State private var numOfPeople = ""
    @State private var numberOfPeople = 2 // index
    
    @State private var tipPercentage = 2 // index
    let tipPercentages = [0, 10, 15, 20, 25]
    
    var displayedNumOfPeople: String {
        return String(numberOfPeople + 2)
    }
    
    var totalPerPerson: Double {
        // calculate total per person here
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        
        let orderAmount: Double = Double(checkAmount) ?? 0
        return (orderAmount * (1 + tipSelection / 100)) / peopleCount
    }
    
    var totalAmount: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount: Double = Double(checkAmount) ?? 0
        return (orderAmount * (1 + tipSelection / 100))
    }
    
    var body: some View {
        NavigationView{
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        // modifier
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        // You need a NavigationView to navigate to the picker (sliding window view)
                        ForEach(2..<100) {number in
                            Text("\(number) People")
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    
                    TextField("Number of people: \(displayedNumOfPeople)", text: $numOfPeople)
                        .keyboardType(.numberPad)
                }
                
                Section (header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {number in
                            Text("\(self.tipPercentages[number])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section (header: Text("Total amount for the check")) {
                    Text("$\(totalAmount, specifier: "%.2f")")
                }
                
                Section (header: Text("Tip Per Person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
            // It needs to be attached inside navigation view - we’re allowing iOS to change titles freely
            .navigationBarTitle("💳 WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
