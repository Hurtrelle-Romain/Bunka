//
//  ContentView.swift
//  Bunka
//
//  Created by apprenant54 on 26/06/2023.
//

import SwiftUI


struct ContentView: View {
    
    var body: some View {
        
        
        VStack{
            HStack{
            Spacer()
                Text("Bunka")
                    Spacer()
                Button(action: {}) {
                    Image(systemName: "xmark")
                        .resizable().aspectRatio(contentMode: .fit).frame(height:40).padding(.horizontal).foregroundColor(.red)
                }
                
            }
            ZStack{
                ForEach(Card.data.reversed()) { card in
                    CardView(card:card).padding(9)
                  
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

struct CardView : View {
    @State var card :Card
    let cardGradient = Gradient (colors: [Color.black.opacity(0), Color.black.opacity(0.5)])
    var body: some View {
        ZStack (alignment: .topLeading) {
            Image(card.imageName)
                .resizable()
                .clipped()
            LinearGradient(gradient: cardGradient, startPoint: .top, endPoint: .bottom)
            
            HStack{
                
                Image(systemName: "heart.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.green)
                    .frame(width: 100)
                    .opacity(Double(card.x/10 - 3))
                    .padding()
                Spacer()
                Image(systemName: "heart.slash.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.red)
                    .frame(width: 100)
                    .opacity(Double(card.x/10 * -1 - 3))
                    .padding()
                    
            }
        }
    
        
        
        .cornerRadius(18)
        // ZStack follow the coordinate of the card model
        .offset(x: card.x , y: card.y)
        .rotationEffect(.init(degrees: card.degree))
        // Gesture recogniser updates the coordinate values of the card model
        .gesture(
        
            DragGesture()
                .onChanged{ value in
                    // user is dragging the view
                    withAnimation(.default) {
                        card.x = value.translation.width
                        card.y = value.translation.height
                        card .degree = 7 * (value.translation.width > 0 ? 1 : -1)
                    }
                }
                .onEnded{ value in
                    withAnimation(.interpolatingSpring(mass:1.0, stiffness: 50, damping : 8, initialVelocity: 0)) {
                        switch value.translation.width {
                        case 0...100:
                            card.x = 0; card.degree = 0; card.y = 0
                        case let x where x > 100:
                            card.x = 500; card.degree = 12
                        case (-100)...(-1):
                            card.x = 0 ; card.degree = 0 ; card.y = 0;
                        case let x where x < -100:
                            card.x = 0; card.degree = 0; card.y = 0;
                        default: card.x = 0; card.y = 0
                        }
                    }
                }
        )
    }
}
