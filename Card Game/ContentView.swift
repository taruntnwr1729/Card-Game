//
//  ContentView.swift
//  Card Game
//
//  Created by Tarun Tanwar on 27/05/26.
//

import SwiftUI

enum Screen{
    
    case firstPage
    case secondPage
    
}
struct RootView: View {
    @State private var currentScreen: Screen = .firstPage
    
    var body: some View {
        switch currentScreen {
        case .firstPage:
        
            FirstScreen(currentScreen: $currentScreen)
            
        case .secondPage:
            SecondScreen(currentScreen: $currentScreen)
        }
    }
}


struct FirstScreen: View {
    @Binding var currentScreen: Screen
    @State private var isAnimated = false
        
    var body: some View {
        
        ZStack{
            Image("background-plain")
            Image("logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 250, height: 250)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .shadow(color: .black.opacity(0.15), radius: 10, x: 0, y: 5)
                        
                        .opacity(isAnimated ? 1.0 : 0.0)
                        .scaleEffect(isAnimated ? 1.0 : 0.6)
                    
                        .onAppear {
                            withAnimation(.spring(response: 0.6, dampingFraction: 0.7)) {
                                isAnimated = true
                            }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                    withAnimation {
                                        currentScreen = .secondPage
                                    }
                                }
                            }
                        }
                }
            }
        
        
struct SecondScreen: View {
    
    
    @Binding var currentScreen: Screen
    
    @State var PlayerCard1 = "card"
    @State var PlayerCard2 = "card"
    @State var PlayerScore1=0
    @State var PlayerScore2=0
    
    @State private var cardScale: CGFloat = 1.0
    
    var body: some View {
        ZStack{
            //I added background here
            Image("background-cloth")
            //then I put logo and cards on top of it stacking vertically
            VStack (){
                /*I arranged everything vertically using VStack but I arranged card Horizontally because they are at the same level, same for text player 1 and player 2,but I wanted no. to be displayed below the text so I put them into VStack
                 */
                Spacer(minLength: 125)
                
                Image("logo")
                Spacer(minLength: 60)
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 30)
                        .fill(ImagePaint(image: Image("background-wood-cartoon")))
                        .frame(width: 360, height: 300)
                        .padding(   )
                        .shadow(radius: 30)
                    
                    
                    HStack(spacing: 20){
                        Spacer()
                        Image(PlayerCard1)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 140, height: 210)
                            .scaleEffect(cardScale)
                        
                        Image(PlayerCard2)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 140, height: 210)
                            .scaleEffect(cardScale)
                        Spacer()
                        
                    }
                }
                Spacer(minLength: 40)
                
                //Button
                Button() {
                    dealCards()
                }label:{
                    Image("button")
                }
                
                Spacer()
                HStack {
                    Spacer()
                    
                    VStack(spacing: 8) {
                        Text("Player 1")
                            .font(.title2)
                            .bold()
                            .foregroundStyle(.white)
                        Text(String(PlayerScore1))
                            .font(.largeTitle)
                            .bold()
                            .foregroundStyle(.white)
                    }
                    
                    Spacer(minLength: 40)
                   
                    VStack(spacing: 8) {
                        Text("Player 2")
                            .font(.title2)
                            .bold()
                            .foregroundStyle(.white)
                        Text(String(PlayerScore2))
                            .font(.largeTitle)
                            .bold()
                            .foregroundStyle(.white)
                    }
                    
                    Spacer()
                }

                Spacer(minLength: 50)
            }
            
            
        }
        Spacer()
        .padding()
    }
    
    
    func dealCards(){
        //things I have to execute is
        //I have to randomize cards
        //and increment the score by plus 1 and update it
        
        
        cardScale = 0.8
        
        
        withAnimation(.spring(response: 0.4, dampingFraction: 0.5)) {
            cardScale = 1.0
            
            let PlayerValue1 = Int.random(in: 2...14)
            let PlayerValue2 = Int.random(in: 2...14)
            
            PlayerCard1 = "card" + String(PlayerValue1)
            PlayerCard2 = "card" + String(PlayerValue2)
            
            if PlayerValue1 > PlayerValue2{
                PlayerScore1 = PlayerScore1 + 1
                
            }else if PlayerValue2 > PlayerValue1{
                PlayerScore2 = PlayerScore2 + 1
                
            }else{
                PlayerScore1 = PlayerScore1 + 1
                PlayerScore2 = PlayerScore2 + 1
                
            }
            
            if PlayerScore1 >= 10 {
                
                print("Player 1 WINS!")
                PlayerScore1 = 0
                PlayerScore2 = 0
                PlayerCard1 = "card"
                PlayerCard2 = "card"
                
                
            }else if PlayerScore2 >= 10 {
                print("Player 2 WINS!")
                PlayerScore2 = 0
                PlayerScore1 = 0
                PlayerCard1 = "card"
                PlayerCard2 = "card"
                
            }else{
                
            }
            
        }
    }
    
}
    #Preview {
        RootView()
    }

