//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Dina Butko on 2023-05-11.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var overallScore: Int = 0
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    
    
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)

                // current VStack(spacing: 15) code
                VStack(spacing: 15){
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) {number in
                        Button {
                            flagTapper(number)
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(color: .white, radius: 5)
                            
                        }
                        
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                Text("Score: \(overallScore)")
                    .font(.title.bold())
                    .foregroundColor(.white)
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(overallScore) 🚀")
        }
    }
    
    func flagTapper(_ number: Int) {
        
        if number == correctAnswer {
            scoreTitle = "Correct 👍"
            overallScore += 1
        } else {
            scoreTitle = "Wrong 👎"
            overallScore -= 1
        }
        showingScore = true
    }
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
