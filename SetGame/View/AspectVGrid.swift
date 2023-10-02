//
//  AspectVGrid.swift
//  SetGame
//
//  Created by 刘军 on 2022/8/20.
//

import SwiftUI
struct MyCustomLayout:Layout{
    @available(iOS 16.0, *)
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        var totalWidth:CGFloat = 0
        var totalHeight:CGFloat = 0
        
        for (index,view) in subviews.enumerated(){
            if index > 0 {
                totalHeight += 10
            }
            let viewSize = view.sizeThatFits(.unspecified)
            totalWidth += viewSize.width + CGFloat(30 * index)
            totalHeight += viewSize.height
        }
        return CGSize(width:totalWidth,height: totalHeight)
    }
    
    @available(iOS 16.0, *)
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        var posX:CGFloat = bounds.origin.x
        var posY:CGFloat = bounds.origin.y
        
        for (index,view) in subviews.enumerated(){
            if index > 0 {
                posY += 1000
                posX += 3000
            }
            view.place(at: CGPoint(x:posX,y:posY), proposal: .unspecified)
            posY += view.sizeThatFits(.unspecified).height
        }
    }
    
    
}
struct AspectVGrid<Item, ItemView>: View where ItemView: View, Item: Identifiable {
    var items: [Item]
    var aspectRatio: CGFloat
    var content: (Item) -> ItemView
    
    init(items: [Item], aspectRatio: CGFloat, @ViewBuilder content: @escaping (Item) -> ItemView) {
        self.items = items
        self.aspectRatio = aspectRatio
        self.content = content
    }
    
    var body: some View {
        GeometryReader { geometry in
           
               VStack {
                    let width: CGFloat = widthThatFits(itemCount: items.count, in: geometry.size, itemAspectRatio: aspectRatio)
                    LazyVGrid(columns: [adaptiveGridItem(width: width)], spacing: 0) {
                        ForEach(items) { item in
                            content(item).aspectRatio(aspectRatio, contentMode: .fit)
                        }
                    }
                    Spacer(minLength: 0)
                }

        }
    }
    
    private func adaptiveGridItem(width: CGFloat) -> GridItem {
        var gridItem = GridItem(.adaptive(minimum: width))
        gridItem.spacing = 0
        return gridItem
    }
    
    private func widthThatFits(itemCount: Int, in size: CGSize, itemAspectRatio: CGFloat) -> CGFloat {
        var columnCount = 1
        var rowCount = itemCount
        repeat {
            let itemWidth = size.width / CGFloat(columnCount)
            let itemHeight = itemWidth / itemAspectRatio
            if  CGFloat(rowCount) * itemHeight < size.height {
                break
            }
            columnCount += 1
            rowCount = (itemCount + (columnCount - 1)) / columnCount
        } while columnCount < itemCount
        if columnCount > itemCount {
            columnCount = itemCount
        }
        return floor(size.width / CGFloat(columnCount))
    }

}

//struct AspectVGrid_Previews: PreviewProvider {
//    static var previews: some View {
//        AspectVGrid()
//    }
//}
