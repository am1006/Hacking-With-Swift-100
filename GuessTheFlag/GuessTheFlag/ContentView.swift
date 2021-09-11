//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Leopold on 11/9/21.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false

    // Must be ONE thing that conforms to the View protocol, otherwise, use Stacks
    var body: some View {
        VStack(alignment: .center) {
            Button("Show Alert") {
                self.showingAlert = true
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Hello World!"), message: Text("Hey! you just triggered the alert!"), dismissButton: .default(Text("OK")))
            }
            
            Button(action: {
                print("Button was tapped")
            }) {
                HStack {
                    Image(systemName: "pencil")
                        .renderingMode(.original)
                    Text("Edit")
                }
            }
            
            // this is a whole view of its own
            LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
            
            RadialGradient(gradient: Gradient(colors: [Color.red, Color.blue]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: /*@START_MENU_TOKEN@*/5/*@END_MENU_TOKEN@*/, endRadius: /*@START_MENU_TOKEN@*/500/*@END_MENU_TOKEN@*/)
            
            AngularGradient(gradient: Gradient(colors: [Color.red, Color.blue, .yellow, .green, .red]), center:.center)
            
            Text("Hello, world!")
                .padding()
            
            Button("Tap me") {
                print("Tapped")
            }
        }
//        .background(Color.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
