//
//  ContentView.swift
//  BetterRest
//
//  Created by Matheus Viana on 21/01/23.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 0.0
    
    var body: some View {
        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
