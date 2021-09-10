//
//  ContentView.swift
//  UnitCon
//
//  Created by Leopold on 10/9/21.
//

import SwiftUI

enum Scale: String, CaseIterable {
    case Celsius = "Celsius"
    case Fahrenheit = "Fahrenheit"
    case Kelvin = "Kelvin"
}

struct ContentView: View {
    @State private var inputScale : Scale = Scale.Celsius
    @State private var inputDegree = ""
    
    @State private var outputScale : Scale = Scale.Celsius
    
    
    var outputDegree: Double {
        // Read inputScale
        // Read outputScale
        
        
        let inputDegreeMeasured: Measurement<UnitTemperature>
        let outputDegreeConverted: Measurement<UnitTemperature>

        
        switch inputScale {
            case .Celsius:
                inputDegreeMeasured = Measurement(value: Double(inputDegree) ?? 0, unit: UnitTemperature.celsius)
            case .Fahrenheit:
                inputDegreeMeasured = Measurement(value: Double(inputDegree) ?? 0, unit: UnitTemperature.fahrenheit)
            case .Kelvin:
                inputDegreeMeasured = Measurement(value: Double(inputDegree) ?? 0, unit: UnitTemperature.kelvin)
        }
        
        switch outputScale {
            case .Celsius:
                outputDegreeConverted = inputDegreeMeasured.converted(to: .celsius)
            case .Fahrenheit:
                outputDegreeConverted = inputDegreeMeasured.converted(to: .fahrenheit)
            case .Kelvin:
                outputDegreeConverted = inputDegreeMeasured.converted(to: .kelvin)
        }
        
        return outputDegreeConverted.value
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section (header: Text("Result in \(outputScale.rawValue)")){
                    Text("\(outputDegree, specifier: "%.3f")")
                }

                Section {
                    GeometryReader { geometry in
                        HStack() {
                            Spacer()
                            Picker("Input Scale", selection: $inputScale) {
                                ForEach(Scale.allCases, id: \.self) {scale in
                                    Text("\(scale.rawValue)")
                                }
                            }
                            .pickerStyle(WheelPickerStyle())
                            .frame(width: geometry.size.width/3, height: geometry.size.height, alignment: .center)
                            .clipped()
                            
                            Spacer()
                            Text("👉")
                            Spacer()
                                
                            Picker("Ouput Scale", selection: $outputScale) {
                                ForEach(Scale.allCases, id: \.self) {scale in
                                    Text("\(scale.rawValue)")
                                }
                            }
                            .pickerStyle(WheelPickerStyle())
                            .frame(width: geometry.size.width/3, height: geometry.size.height)
                            .clipped()
                            
                            Spacer()
                        }
                    }
                }
                .frame(height: 200)

                
                Section (header: Text("Input in \(inputScale.rawValue)")) {
                    TextField ("Type your input here :)", text: $inputDegree)
                        .keyboardType(.decimalPad)
                }
            }
            .navigationBarTitle("🌡 UnitCon")
        }
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
