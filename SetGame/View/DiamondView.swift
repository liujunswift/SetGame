//
//  DiamondView.swift
//  SetGame
//
//  Created by 刘军 on 2022/8/20.
//

import SwiftUI

struct DiamondView: Shape {

    func path(in rect: CGRect) -> Path {
      
        let startPoint:CGPoint = CGPoint(x: rect.midX, y: rect.midX*0.3)
        let secondPoint:CGPoint = CGPoint(x: rect.midX/2, y: rect.midX*0.5)
        let thirdPoint:CGPoint = CGPoint(x: rect.midX, y: rect.midX*2/3 )
        let fouthPoint:CGPoint = CGPoint(x: rect.midX + rect.midX/2, y: rect.midX*0.5)
        var diamondPath = Path()
        diamondPath.move(to: startPoint)
        diamondPath.addLine(to: secondPoint)
        diamondPath.addLine(to: thirdPoint)
        diamondPath.addLine(to: fouthPoint)
        diamondPath.closeSubpath()
        return diamondPath
        }
    }
    









struct DiamondView_Previews: PreviewProvider {
    static var previews: some View {
        DiamondView()
    }
}
