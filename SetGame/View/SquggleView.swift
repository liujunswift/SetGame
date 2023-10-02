//
//  SquggleView.swift
//  SetGame
//
//  Created by 刘军 on 2022/8/21.
//

import SwiftUI

struct SquggleView: Shape {
    func path(in rect: CGRect) -> Path {
        var squgglePath = Path()
        
        
        let startPoint = CGPoint(x: rect.midX*0.5, y: rect.midX/3 )
        let secondPoint = CGPoint(x: rect.midX*1.5, y: rect.midX/3)
   
        squgglePath.move(to:startPoint)
        
        squgglePath.addCurve(to: secondPoint,
                             control1:CGPoint(x: rect.midX*0.8, y:rect.midX*0.1),
                             control2: CGPoint(x: rect.midX*1.2, y: rect.midX*0.7))
    
        squgglePath.addCurve(to: startPoint,
                             control1:CGPoint(x: rect.midX*1.2, y: rect.midX*0.9 ),
                             control2: CGPoint(x: rect.midX*0.1, y: rect.midX*0.3))
       
        
        
        
        squgglePath.addArc(center: CGPoint(x: rect.midX*0.65, y: rect.midX*0.35), radius:2, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 360), clockwise: true)
       
        return squgglePath
        
        
        
        
        
    }
    

}




struct SquggleView_Previews: PreviewProvider {
    static var previews: some View {
        SquggleView()
    }
}
