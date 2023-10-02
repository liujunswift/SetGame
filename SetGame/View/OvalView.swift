//
//  OvalView.swift
//  SetGame
//
//  Created by 刘军 on 2022/8/21.
//

import SwiftUI

struct OvalView: Shape{
    func path(in rect: CGRect) -> Path {
        var ovalPath = Path()
        
        ovalPath.addArc(center: CGPoint(x: rect.midX-rect.midX/5, y: rect.midX*0.5),
                        radius: rect.midX*0.7/3,
                        startAngle: Angle(degrees:270), endAngle: Angle(degrees: 90),
                        clockwise: true, transform: .identity)

        ovalPath.addArc(center: CGPoint(x:rect.midX + rect.midX/5 , y: rect.midX*0.5),
                        radius: rect.midX*0.7/3,
                        startAngle: Angle(degrees: 90), endAngle: Angle(degrees:270),
                        clockwise: true, transform: .identity)
        ovalPath.closeSubpath()
        return ovalPath
    }
 
}

















struct OvalView_Previews: PreviewProvider {
    static var previews: some View {
        OvalView()
    }
}
