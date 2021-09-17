//
//  ContentView.swift
//  BrainTraining
//
//  Created by Leopold on 16/9/21.
//

import SwiftUI

struct ContentView: View {
    private var moves = ["Rock", "Paper", "Scissors"]
    @State private var currentChoice = Int.random(in: 0 ... 2)
    @State private var playerChoice = 0
    @State private var playerShouldWin = Bool.random()
    @State private var score = 0
    
    @State private var count = 0
    @State private var gameEnds = false
    
    func isPlayerWinner(appMove: Int, playerMove: Int) -> Bool {
        var playerWins: Bool
        
        if (appMove + 1) % 3 == playerMove {
            playerWins = true
        }
        else if (appMove == playerMove) {
            playerWins = false
        }
        else {
            playerWins = false
        }
        
        return playerWins
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                VStack{
                    Text("Your Current Score")
                        .font(.headline)
                        .fontWeight(.light)
                    Text("\(score)")
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                .padding()

                VStack {
                    Text("The App's move")
                        .font(.headline)
                        .fontWeight(.light)
                    Text("\(moves[currentChoice])")
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                .padding()
            }
            
            Text("Game round \(count): You Should")
                .font(.headline)
                .fontWeight(.light)
            Text(playerShouldWin ? "Win" : "Lose")
                .font(.largeTitle)
                .fontWeight(.black)

            Spacer()
            
            HStack {
                Button(action: {
                    playerChoice = 0
                    
                    if playerShouldWin == isPlayerWinner(appMove: currentChoice, playerMove: playerChoice) {
                        score += 1
                    }
                    else {
                        score -= 1
                    }
                    
                    currentChoice = Int.random(in: 0 ... 2)
                    playerShouldWin = Bool.random()
                    
                    count += 1
                    gameEnds = count == 10
                }) {
                    HStack {
                        Image("Rock")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20)
                        Text("\(moves[0])")
                            .fontWeight(.semibold)
                    }
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
                
                Button(action: {
                    playerChoice = 1
                    if playerShouldWin == isPlayerWinner(appMove: currentChoice, playerMove: playerChoice) {
                        score += 1
                    }
                    else {
                        score -= 1
                    }
                    
                    currentChoice = Int.random(in: 0 ... 2)
                    playerShouldWin = Bool.random()
                    
                    count += 1
                    gameEnds = count == 10
                }) {
                    HStack {
                        Image("Paper")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20)
                        Text("\(moves[1])")
                            .fontWeight(.semibold)
                    }
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)

                Button(action: {
                    playerChoice = 2
                    if playerShouldWin == isPlayerWinner(appMove: currentChoice, playerMove: playerChoice) {
                        score += 1
                    }
                    else {
                        score -= 1
                    }
                    
                    currentChoice = Int.random(in: 0 ... 2)
                    playerShouldWin = Bool.random()
                    
                    count += 1
                    gameEnds = count == 10
                }) {
                    HStack {
                        Image("Scissors")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20)
                        Text("\(moves[2])")
                            .fontWeight(.semibold)
                    }
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
            }

            Spacer()
        }
        .alert(isPresented: $gameEnds, content: {
            Alert(title: Text("Game ends!"), message: Text("Your score is \(score)."), dismissButton: .default(Text("Restart")) {
                    count = 0
                    score = 0
            })
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
