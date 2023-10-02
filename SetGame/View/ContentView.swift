//
//  ContentView.swift
//  SetGame
//
//  Created by 刘军 on 2022/8/20.
//

import SwiftUI

struct ContentView: View {
    
    
    @Namespace private var cardApearAnimation:Namespace.ID
    @Namespace private var disCardAnimation:Namespace.ID
    
    @ObservedObject var game:SetGame
    
    // build cards view
    
    
    
    
    
    
    
    @ViewBuilder
    var cardsView:some View {
        AspectVGrid(items: game.disPlayCards, aspectRatio: viewConstant.cardAspectRatio){ card in
            
            CardView(card: card,
                     opacity: game.cardBolderOpacity(card: card),
                     color: game.cardBolderColor(card: card))
            .hueRotation(Angle(degrees: game.setGame.judgmentOfIsSetCards ? 0 : 360))
            .rotationEffect(game.animationAngle(card: card))
            .matchedGeometryEffect(id: card.id, in:cardApearAnimation)
            .matchedGeometryEffect(id: card.id, in: disCardAnimation)
            .onTapGesture {
                withAnimation(){
                    game.chooseACard(card: card)
                }
            }
        }
        .onAppear{
            for index in 0...(game.gameStartCardsCount/3 - 1){
                withAnimation(.spring().delay(Double(index) *  Double(1 / Double(game.gameStartCardsCount)))){
                    game.addThreeMoreCards()
                }
            }
        }
    }
    
    // deck of cards  and discard deck of cards
    @ViewBuilder
    var deckView:some View {
        VStack{
            HStack{
                ZStack{
                    ForEach(game.setGame.deckOfCards){card in
                        CardView(card: card,
                                 opacity: game.cardBolderOpacity(card: card),
                                 color: game.cardBolderColor(card: card))
                        .matchedGeometryEffect(id: card.id, in:cardApearAnimation)
                        .frame(width:60,height: 90)
                        .offset(x: Double(game.setGame.deckOfCards.firstIndex(of: card)!) * 0.05,y: -Double(game.setGame.deckOfCards.firstIndex(of: card)!) * 0.05)
                        .zIndex(-Double(game.setGame.deckOfCards.firstIndex(of: card)!))
                        
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 2)){
                                if !game.setGame.judgmentOfIsSetCards{
                                    game.addThreeMoreCards()
                                }else{
                                    game.setGame.clearIsSetCards()
                                    withAnimation(.easeInOut.delay(1)){
                                        game.addThreeMoreCards()
                                    }
                                }
                            }
                        }
                    }
                }
                Spacer()
                buttonView
                Spacer()
                discardsDeckView
            }
        }
    }
    
    @ViewBuilder
    var discardsDeckView:some View {
        
        if !game.setGame.disCards.isEmpty{
            ZStack{
                ZStack{
                    ForEach(game.setGame.disCards){card in
                        CardView(card: card,
                                 opacity: game.cardBolderOpacity(card: card),
                                 color: game.cardBolderColor(card: card))
                        .matchedGeometryEffect(id: card.id, in: disCardAnimation)
                    }
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 5).foregroundColor(.white)
                    Text("🌞").font(.largeTitle)
                       
                    RoundedRectangle(cornerRadius: 5).stroke().foregroundColor(.gray)
                    RoundedRectangle(cornerRadius: 5).fill().foregroundColor(.gray).opacity(0.2)
                }.zIndex(100)
            }
            .frame(width: 60,height: 90)
        }
        
        
    }

    // build button view areas
    
    @ViewBuilder
    var buttonView:some View {
        VStack{
            HStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 5).frame(width: 60,height: 90).foregroundColor(.white)
                    Button(action:{
                        game.startANewGame()
                        for index in 0...(game.gameStartCardsCount/3 - 1){
                            withAnimation(.spring().delay(Double(index) *  Double(1 / Double(game.gameStartCardsCount)))){
                                game.addThreeMoreCards()
                            }
                        }
                    }
                    ){
                        Image(systemName: "gobackward")
                            .renderingMode(.template)
                    }
                }
            }
            .font(.largeTitle)
        }
    }
    
    //Display game scores
    
    @ViewBuilder
    var scoreView:some View {
        Text("Score:\(game.setGame.scores)")
            .font(.largeTitle)
    }
    
    
    var body: some View {
        VStack(spacing:0){
            scoreView
            cardsView
            deckView
        }
        .padding()
    }
    
    
    private struct viewConstant{
        static let cardAspectRatio:Double = 2/3
        
        
        
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetGame()
        ContentView(game:game)
    }
}
