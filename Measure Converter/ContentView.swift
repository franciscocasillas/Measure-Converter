//
//  ContentView.swift
//  Measure Converter
//
//  Created by Francisco Jean on 05/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var inputNumber: Double = 0
    @State private var selectedInputMeasure = "meters"
    @State private var selectedOutputMeasure = "meters"
    
    let measures = ["meters", "km", "feet", "yards", "miles"]
    
    var valueInMeters: Double {
        switch selectedInputMeasure {
        case "meters":
            return inputNumber
        case "km":
            return inputNumber / 1000
        case "feet":
            return inputNumber / 3.28084
        case "yards":
            return inputNumber / 1.09361
        case "miles":
            return inputNumber / 1609.344
        default:
            return 0
        }
    }
    
    var valueInSelectedMeasure: Double {
        switch selectedOutputMeasure{
        case "meters":
            return valueInMeters
        case "km":
            return valueInMeters / 1000
        case "feet":
            return valueInMeters * 3.28084
        case "yards":
            return valueInMeters * 1.09361
        case "miles":
            return valueInMeters / 1609.344
        default:
            return 0
        }
    }
    
    var body: some View {
            NavigationStack {
                Form {
                    Section("From") {
                        VStack {
                            TextField("From", value: $inputNumber, format: .number)
                                .keyboardType(.decimalPad)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .multilineTextAlignment(.center)
                            
                            Picker("Select a measure", selection: $selectedInputMeasure) {
                                ForEach(measures, id: \.self) { measure in
                                    Text(measure)
                                }
                            }
                            .pickerStyle(.segmented)
                            .frame(width: UIScreen.main.bounds.width * 0.75)
                        }
                    }
                    
                    Section("To") {
                        VStack {
                            Text("\(valueInSelectedMeasure, format: .number)")
                            
                            Picker("Select a measure", selection: $selectedOutputMeasure) {
                                ForEach(measures, id: \.self) { measure in
                                    Text(measure)
                                }
                            }
                            .pickerStyle(.segmented)
                            .frame(width: UIScreen.main.bounds.width * 0.75)
                        }
                    }
                }
                .navigationTitle("Measure Converter")
            }
        }
    }

#Preview {
    ContentView()
}
