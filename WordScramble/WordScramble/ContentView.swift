//
//  ContentView.swift
//  WordScramble
//
//  Created by Leopold on 26/9/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let people = ["Finn", "Leia", "Luke", "Rey"]

        VStack {
            List {
                Text("Hello world!")
                Text("Hello world!")
                Text("Hello world!")
                Text("Hello world!")
                
                Section(header: Text("Dynamic Rows")) {
                    ForEach(0..<5) {
                        Text("Dynamic row \($0)")
                    }
                }
            }
            
            List(people, id: \.self) {
                Text($0)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
