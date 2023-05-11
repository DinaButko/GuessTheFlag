//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Dina Butko on 2023-05-11.
//

import SwiftUI

struct ContentView: View {
    
    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    var correctAnswer = Int.random(in: 0...2)
    
    
    var body: some View {
        ZStack {
            Color.yellow
                .ignoresSafeArea()
            VStack(spacing: 30){
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.black)
                    Text(countries[correctAnswer])
                        .foregroundColor(.black)
                }
                
                ForEach(0..<3) {number in
                    Button {
                        //flag was tapped
                    } label: {
                        Image(countries[number])
                            .renderingMode(.original)
                        
                    }
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
