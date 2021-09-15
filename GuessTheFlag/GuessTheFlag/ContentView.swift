//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Leopold on 11/9/21.
//

import SwiftUI

struct FlagImage: View {
    var countryName: String

    var body: some View {
        Image(countryName)
            .renderingMode(.original)
            .clipShape(RoundedRectangle(cornerRadius: 15, style: .circular))
            .shadow(radius: 10)
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    
    // Detect system color mode
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ZStack {
            Color(colorScheme == .light ? CGColor(red: 0.93, green: 0.94, blue: 0.96, alpha: 1) : CGColor(red: 0.18, green: 0.20, blue: 0.25, alpha: 1.00)).ignoresSafeArea()

            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .font(.headline)
                        .fontWeight(.light)
                    Text(countries[correctAnswer])
                        .font(.largeTitle)
                        .fontWeight(.black)
                    Text("Current Score: \(score)")
                        .font(.headline)
                        .fontWeight(.light)
                }
                
                ForEach(0 ..< 3) {number in
                    Button(action: {
                        // flag tapped
                        self.flagTapped(number)
                    }, label: {
                        FlagImage(countryName: self.countries[number])
                    })
                }
                
                Spacer()
            }
        }
        .alert(isPresented: $showingScore, content: {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(score)."), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        })
    }
    
    func flagTapped(_ number: Int) {
        scoreTitle = (number == correctAnswer) ? "Correct😀" : "Wrong😡That’s the flag of \(countries[number])!"
        score = (number == correctAnswer) ? score + 1 : score
        showingScore = true
    }
    
    func askQuestion() {
        countries = countries.shuffled()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
