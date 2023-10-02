//
//  Card.swift
//  SetGame
//
//  Created by 刘军 on 2022/8/20.
//

import Foundation

struct Card:Equatable,Identifiable,Hashable {
    var id = UUID()
    
    
    var symbol :SymbolShape
    var symbolColor  :SymbolColor
    var symbolShading:SymbolShading
    var symbolNumber :SymbolNumber

    enum SymbolShape{
        case diamond
        case squiggle
        case oval
      static var allSymbolCases = [SymbolShape.diamond,.squiggle,.oval]

    }
    enum SymbolColor{
        case red
        case green
        case purple
        static var allSymbolColors = [SymbolColor.red,.green,.purple]
    }
    enum SymbolShading{
        case solid
        case striped
        case open
        static var allSymbolShadings = [SymbolShading.solid,.open,.striped]
    }
    enum SymbolNumber{
        case one
        case two
        case three
        static var allSymbolNumber = [SymbolNumber.one,.two,.three]
    }
    
}
