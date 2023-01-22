//
//  ContentView.swift
//  BetterRest
//
//  Created by Matheus Viana on 21/01/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text(Date.now.formatted(date: .long, time: .complete))
    }
    
    func trivialExample() {
        let compoenents = Calendar.current.dateComponents([.hour, .minute], from: Date.now)
        let hour = compoenents.hour ?? 0
        let minute = compoenents.minute ?? 0
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
