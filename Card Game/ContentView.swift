//
//  ContentView.swift
//  Card Game
//
//  Created by Tarun Tanwar on 27/05/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            //I added background here
            Image("background-cloth")
            //then I put logo and cards on top of it stacking vertically
            VStack (){
                Spacer(minLength: 125)
                
                Image("logo")
                Spacer(minLength: 60)
                HStack{
                    Spacer()
                    Image("card2")
                    Spacer()
                    Image("card12")
                    Spacer()
                }
                Spacer(minLength: 40)
                Image("button")
                Spacer()
                
                
                HStack{
                    Spacer()
                    VStack{
                        
                        Spacer()
                        Text("Player 1")
                            .font(.title)
                        Text("0")
                            .font(.title2)
                            .padding(.bottom)
                        Spacer(minLength: 30)
                        
                    }
                    Spacer()
                    VStack{
                        Spacer()
                        Text("Player 2")
                            .font(.title)
                        Text("0")
                            .font(.title2)
                            .padding(.bottom)
                        Spacer()
                        
                    }
                    Spacer()
                    
                    }
                Spacer(minLength: 50)
                }
                
                
            }
            .padding()
        }
    }


#Preview {
    ContentView()
}
