//
//  ContentView.swift
//  Card Game
//
//  Created by Tarun Tanwar on 27/05/26.
//

import SwiftUI


struct ContentView: View {
    @State var PlayerCard1 = "card"
    @State var PlayerCard2 = "card"
    @State var PlayerScore1=0
    @State var PlayerScore2=0
    
    @State private var winMessage = ""
    @State private var showWinAlert = false
    
    
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
                        .shadow(radius: 30)
                        
                    
                    HStack{
                        Spacer()
                        Image(PlayerCard1)
                        Spacer()
                        Image(PlayerCard2)
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
                    
                
                HStack{
                    Spacer()
                    VStack{
                        
                        Spacer()
                        Text("Player 1")
                            .font(.title)
                            .foregroundStyle(.white)
                        Text(String(PlayerScore1))
                            .foregroundStyle(.white)
                            .font(.title2)
                            .padding(.bottom)
                        Spacer()
                        
                    }
                    Spacer()
                    VStack{
                        Spacer()
                        Text("Player 2")
                            .font(.title)
                            .foregroundStyle(.white)
                        Text(String(PlayerScore2))
                            .foregroundStyle(.white)
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
    
    //Remember: When defining functions we do it below the body of UI in Swift, but in python we do it before the function is called.
    
    func dealCards(){
        //things I have to execute is
        //I have to randomize cards
        //and increment the score by plus 1 and update it
        
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
// Without this we cant get preview of our UI on the screen
#Preview("iPhone 16") {
    ContentView()
}

