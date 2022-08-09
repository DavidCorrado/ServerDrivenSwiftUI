//
//  SizeViewModifier.swift
//  ServerDriveniOS
//
//  Created by Firat Özsarıkamış on 9.08.2022.
//

import SwiftUI

struct SizeViewModifier: ViewModifier {
    var serverView: ServerView
    var serverModifier: ServerModifier?
    var weight: CGFloat?
    var alignment: Alignment?
    var parentWeightDirection: WeightDirection
    var parentSize: CGFloat
    var parentTotalWeight: CGFloat?
    var nestedInVerticalLayout: Bool
    var nestedInHorizontalLayout: Bool
    
    func body(content: Content) -> some View {
        let width = getWidth()
        let height = getHeight()
        
        let fixedWidth = width == .infinity ? nil: width
        let fixedHeight = height == .infinity ? nil: height
        
        let maxWidth: CGFloat? = width == .infinity ? width: nil
        let maxHeight = height == .infinity ? height: nil
        
        let alignment = alignment ?? .topLeading
        
        return content
            .frame(width: fixedWidth, height: fixedHeight, alignment: alignment)
            .frame(maxWidth: maxWidth, maxHeight: maxHeight, alignment: alignment)
    }
    
    private func getHeight(ignoreAspectRatio: Bool = false) -> CGFloat? {
        var height = serverModifier?.height // Take fixed height first
        if let fixedHeight = height {
            height = fixedHeight + (serverModifier?.paddingTop ?? 0) + (serverModifier?.paddingBottom ?? 0)
        }
 
        // If there is no fixed height, but view has a weight and can grow vertically with weight calculate new height
        if height == nil, let weight = weight, parentSize > 0 {
            if parentWeightDirection == .vertical {
                var multiplier: CGFloat = 1
                if let parentTotalWeight = parentTotalWeight {
                    multiplier = weight / parentTotalWeight
                }
                height = parentSize * multiplier // Calculate height from the available height of the parent
            } else if nestedInVerticalLayout == false { // just else might also work but boxes can inherit weight direction, maybe we should disable that then we can remove nestedInVerticalLayout completely
                if let weightedContainer = serverView as? ServerWeightedContainer, weightedContainer.weightDirection == .vertical, weightedContainer.getTotalWeight(for: .vertical) ?? 0 > 0 {
                    height = .infinity // fill the parent if we have weight in opposite weight direction
                }
            }
        }
        // Manually calculate height for aspect ratio if we have manually calculated width and there is no height
        if ignoreAspectRatio == false, let aspectRatio = serverModifier?.aspectRatio, height == nil, let width = getWidth(ignoreAspectRatio: true) {
            height = width / CGFloat(aspectRatio)
        }
        
        return height
    }
    
    private func getWidth(ignoreAspectRatio: Bool = false) -> CGFloat? {
        var width = serverModifier?.width
        if let fixedWidth = width {
            width = fixedWidth + (serverModifier?.paddingStart ?? 0) + (serverModifier?.paddingEnd ?? 0)
        }
        // If there is no fixed width, but view has a weight and can grow horizontally with weight calculate new height
        if width == nil, let weight = weight, parentSize > 0 {
            if parentWeightDirection == .horizontal {
                var multiplier: CGFloat = 1
                if let parentTotalWeight = parentTotalWeight {
                    multiplier = weight / parentTotalWeight
                }
                width = parentSize * multiplier // Calculate width from the available width of the parent
            } else if nestedInHorizontalLayout == false {// just else might also work but boxes can inherit weight direction, maybe we should disable that then we can remove nestedInHorizontalLayout completely
                if let weightedContainer = serverView as? ServerWeightedContainer, weightedContainer.weightDirection == .horizontal, weightedContainer.getTotalWeight(for: .horizontal) ?? 0 > 0 {
                    width = .infinity // fill the parent if we have weight in opposite weight direction
                }
            }
        }
        // Manually calculate width for aspect ratio if we have manually calculated height and there is no width
        if ignoreAspectRatio == false, let aspectRatio = serverModifier?.aspectRatio, width == nil, let height = getHeight(ignoreAspectRatio: true) {
            width = height * CGFloat(aspectRatio)
        }
        
        return width
    }
}
