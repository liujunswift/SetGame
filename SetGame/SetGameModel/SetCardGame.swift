//
//  SetGame.swift
//  SetGame
//
//  Created by 刘军 on 2022/8/20.
//

import Foundation

struct SetCardGame{
    
    
    private(set) var deckOfCards = [Card]()
    private(set) var toBechoosingCards = [Card]()
    private(set) var scores = 0
    private(set) var disCards = [Card]()
    
    mutating func addOneChoosingCardFromDeck(){
        if !deckOfCards.isEmpty{
          toBechoosingCards.append(deckOfCards.removeFirst())
        }
    }

    mutating func chooseACard(card:Card){
             clearIsSetCards()
            if isSetCards.contains(card){
                if let  cardIndex = isSetCards.firstIndex(where: {$0 == card}){
                    isSetCards.remove(at: cardIndex)
                }
            }else{
                if let cardIndex = toBechoosingCards.firstIndex(where: {$0 == card}){
                    isSetCards.append(toBechoosingCards[cardIndex])
                }
        }
    }

 
    private(set) var isSetCards = [Card]()
    var judgmentOfIsSetCards :Bool{
        get{
            if isSetCards.count == 3{
             return   chooseASet(setCards: isSetCards)
            }else{
             return false
            }
        }
        set{
            if newValue {
                if isSetCards.count == 3{
                    scores += 3
                    for card in isSetCards{
                    if let cardIndex = toBechoosingCards.firstIndex(where: {$0 == card}){
                        if !deckOfCards.isEmpty{
                            toBechoosingCards[cardIndex] = deckOfCards.remove(at: 0)
                        }else{
                            toBechoosingCards.remove(at: cardIndex)
                        }
                      }
                   }
                    isSetCards.removeAll()
                }
            }
        }

    }

    // clear the choosedCards(cardsCount == 3)
    mutating func clearIsSetCards(){
        if isSetCards.count == 3{
            if judgmentOfIsSetCards {
                scores += 3
                for card in isSetCards{
                      disCards.append(card)
                if let cardIndex = toBechoosingCards.firstIndex(where: {$0 == card}){
                    
//                    if !deckOfCards.isEmpty{
//                       toBechoosingCards[cardIndex] = deckOfCards.remove(at: 0)
//                    }else{
                       toBechoosingCards.remove(at: cardIndex)
//                    }
                  }
                }
            }else{
                scores -= 1
            }
              isSetCards.removeAll()
        }
    }
    // main logic of make a set
    func chooseASet(setCards:[Card])->Bool{
       var boolValue = false
       var symbolSet = Set<Card.SymbolShape>()
       var symbolColorSet = Set<Card.SymbolColor>()
       var symbolShadingSet = Set<Card.SymbolShading>()
       var symbolNumberSet = Set<Card.SymbolNumber>()
       
       for card in setCards{
           symbolSet.insert(card.symbol)
           symbolColorSet.insert(card.symbolColor)
           symbolNumberSet.insert(card.symbolNumber)
           symbolShadingSet.insert(card.symbolShading)
           
       }
           let setArray = [symbolColorSet.count,symbolShadingSet.count,symbolSet.count,symbolNumberSet.count]
           if !setArray.contains(where: {$0 == 2}){
               boolValue = true
           }else{
               boolValue = false
           }
       return boolValue
   }
    
    
    
    
    
    
    
    init(toBechoosingCardsCount:Int){
// init deck of cards (total 81)
        for symbol in Card.SymbolShape.allSymbolCases{
            for symbolNumber in Card.SymbolNumber.allSymbolNumber{
                for symbolColor in Card.SymbolColor.allSymbolColors{
                    for symbolShading in Card.SymbolShading.allSymbolShadings{
                        deckOfCards.append(Card(symbol: symbol, symbolColor: symbolColor, symbolShading: symbolShading, symbolNumber: symbolNumber))
                            deckOfCards.shuffle()
                    }
                }
            }
        }
//  initial to be choosing cards
        if toBechoosingCardsCount > 0{
            let initCardsCount = min(toBechoosingCardsCount,deckOfCards.count)
            for _ in 0...(initCardsCount - 1){
                addOneChoosingCardFromDeck()
            }
        }

    }
}
