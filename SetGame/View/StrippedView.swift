//
//  StrippedView.swift
//  SetGame
//
//  Created by 刘军 on 2022/8/24.
//

import SwiftUI

struct StrippedView: Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
        for valueOfX in stride(from: 0, to: rect.maxX , by: 3){
            path.move(to: CGPoint(x: valueOfX, y: 0))
            path.addLine(to: CGPoint(x: valueOfX, y: rect.maxY))

            path.addLine(to: CGPoint(x: valueOfX + 1, y: rect.maxY))
            path.addLine(to: CGPoint(x: valueOfX + 1, y: 0))
            
            }
            return path
        }
}

struct StrippedView_Previews: PreviewProvider {
    static var previews: some View {
        StrippedView()
    }
}
