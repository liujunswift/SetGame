//
//  CardView.swift
//  SetGame
//
//  Created by 刘军 on 2022/8/20.
//

import SwiftUI

struct CardView: View ,Equatable{
   
   
    
    var card :Card 
    var opacity = 0.2
    var color = Color.gray
    
    
    @ViewBuilder
    var cardSymbol:some View {
        switch card.symbol {
        case .diamond:
            switch card.symbolShading{
            case.open: DiamondView().stroke().foregroundColor(cardSymbolColor)
            case.solid:DiamondView().foregroundColor(cardSymbolColor)
            case.striped:DiamondView().stripe(forgroundColor: cardSymbolColor)
            }
        case.oval:
            switch card.symbolShading{
            case.open: OvalView().stroke().foregroundColor(cardSymbolColor)
            case.solid:OvalView().foregroundColor(cardSymbolColor)
            case.striped: OvalView().stripe(forgroundColor: cardSymbolColor)
            }
        case .squiggle:
            switch card.symbolShading{
            case.open: SquggleView().stroke().foregroundColor(cardSymbolColor)
            case.solid:SquggleView().foregroundColor(cardSymbolColor)
            case.striped:SquggleView().stripe(forgroundColor: cardSymbolColor)
            }
        }
    }
    var cardSymbolColor:Color{
        switch card.symbolColor{
        case.red:return Color.red
        case.green:return Color.green
        case.purple:return Color.purple
        }
    }
   
    @ViewBuilder
    var cardView:some View{
        switch card.symbolNumber{
        case.one:
            VStack{
                cardSymbol.opacity(0)
                cardSymbol
                cardSymbol.opacity(0)
            }
        case.two:
            VStack(spacing:0){
                Spacer()
                cardSymbol
                cardSymbol
            }
        case.three:
            VStack(spacing:0){
                Spacer()
                cardSymbol
                cardSymbol
                cardSymbol
                Spacer()
            }
        }
    }
   
    

    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 5).foregroundColor(.white)
            cardView
//            RoundedRectangle(cornerRadius: 5).strokeBorder().opacity(opacity)
            RoundedRectangle(cornerRadius:5).foregroundColor(color).opacity(0.2)
        }
        .padding(2)
    }
}

 

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView()
//    }
//}

extension Shape{
    func stripe(forgroundColor:Color)->some View {
            return ZStack{
                self.foregroundColor(forgroundColor)
                StrippedView().stroke().foregroundColor(.white)
                self.stroke().foregroundColor(forgroundColor)
            }
        }
    }













