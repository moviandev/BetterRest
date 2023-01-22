//
//  ContentView.swift
//  BetterRest
//
//  Created by Matheus Viana on 21/01/23.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date.now
    
    var body: some View {
        DatePicker("Please enter a time", selection: $wakeUp, in: Date.now...)
            .labelsHidden()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
