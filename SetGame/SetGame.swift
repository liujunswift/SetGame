//
//  SetGame.swift
//  SetGame
//
//  Created by 刘军 on 2022/8/22.
//

import SwiftUI

class SetGame:ObservableObject{
    
    @Published var setGame =  SetCardGame(toBechoosingCardsCount: 0)
    var gameStartCardsCount = 15
 
    var disPlayCards :[Card]{
        setGame.toBechoosingCards
    }
    
    
    
    func addThreeMoreCards(){
        for _ in 0...2{
            setGame.addOneChoosingCardFromDeck()
        }
    }
    
    func chooseACard(card:Card){
        setGame.chooseACard(card: card)
    }
    
    
    //animation func when matching is happening
    func animationAngle(card:Card)->Angle{
        
        var angleValue = Angle()
        if setGame.isSetCards.contains(card){
            if setGame.isSetCards.count == 3{
                if setGame.judgmentOfIsSetCards == false{
                    angleValue = Angle(degrees: 360)
                }
            }
        }
        return angleValue   
    }
    
    // change card Bolder View  when choosing happened
    func cardBolderColor(card:Card)->Color{
        var colorValue = Color.gray
        if setGame.isSetCards.contains(card){
            colorValue = .blue
            if setGame.isSetCards.count == 3{
                if setGame.judgmentOfIsSetCards == true{
                    colorValue = .green
                }else{
                    colorValue = .red
                }
            }
        }
        return colorValue
    }
    
    func cardBolderOpacity(card: Card)->Double{
        
        
   
        var opacity = 0.1
        if setGame.isSetCards.contains(card){
            opacity = 1.0
        }
        return opacity
    }
    

    
    
    
    
    
    //TODO:startNewGame
    
    func startANewGame() {
        setGame = SetCardGame(toBechoosingCardsCount: 0)
    }
    
}


