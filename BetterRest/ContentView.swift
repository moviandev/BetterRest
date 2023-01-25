//
//  ContentView.swift
//  BetterRest
//
//  Created by Matheus Viana on 21/01/23.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount: Double = 4
    @State private var coffeeAmount = 1
    
    var idealBedTime: String {
        calculateBedTime()
    }
    
    static var defaultWakeTime: Date {
        var compoenents = DateComponents()
        compoenents.hour = 7
        compoenents.minute = 0
        
        return Calendar.current.date(from: compoenents) ?? Date.now
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                } header: {
                    Text("When do you want to wake up?")
                        .font(.body)
                }
                
                Section {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                } header: {
                    Text("Desired amount of sleep")
                        .font(.body)
                }
                
                Section {
                    Picker("Cups of coffee", selection: $coffeeAmount) {
                        ForEach(1...20, id: \.self) {
                            Text($0.formatted())
                        }
                    }
                } header: {
                    Text("Daily coffee intake")
                        .font(.body)
                }
                
                Section {
                    Text(idealBedTime)
                        .font(.body)
                    

                } header: {
                    Text("Your Ideal bedtime")
                        .font(.body)
                }
                
            }
            .navigationTitle("BetterRest")
        }
    }
    
    func calculateBedTime() -> String {
         var idealBedTime = ""
        do {

            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            idealBedTime = "\(sleepTime.formatted(date: .omitted, time: .shortened))"

        } catch {
            idealBedTime = "Error calulating your ideal bedtime"
        }
        
        return idealBedTime
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
