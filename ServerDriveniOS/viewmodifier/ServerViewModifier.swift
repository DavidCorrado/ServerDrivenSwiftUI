//
//  ServerViewModifier.swift
//  ServerDriveniOS
//
//  Created by David Corrado on 7/6/22.
//

import Foundation
import SwiftUI

// This will be .vertical for VStack, horizontal for HStack and outer LazyVStack with a scroll view
// Because weight needs to fill horizontally on scrolling views with a VStack
enum WeightDirection {
    case vertical
    case horizontal
    case none
}

struct ServerViewModifier: ViewModifier {
    var serverView: ServerView
    var alignment: Alignment?
    var parentWeightDirection: WeightDirection // Weight filling direction
    var parentSize: CGFloat // Available size of the parent after removing spacings and paddings for supporting weights
    var parentTotalWeight: CGFloat?
    func body(content: Content) -> some View {
        content
            .padding(serverModifier: serverView.modifier)
            .size(serverModifier: serverView.modifier, weight: serverView.getWeight(for: parentWeightDirection), alignment: alignment, parentWeightDirection: parentWeightDirection, parentSize: parentSize, parentTotalWeight: parentTotalWeight)
            .aspectRatio(serverModifier: serverView.modifier)
            .backgroundColor(serverModifier: serverView.modifier)
            .cornerRadius(serverModifier: serverView.modifier)
            .accessibilityLabel(serverModifier: serverView.modifier)
    }
}

struct PaddingViewModifier: ViewModifier {
    var serverModifier: ServerModifier?
    func body(content: Content) -> some View {
        content
            .modifyIf(serverModifier?.paddingStart != nil, transform: { $0.padding(.leading, serverModifier?.paddingStart) })
            .modifyIf(serverModifier?.paddingEnd != nil, transform: { $0.padding(.trailing, serverModifier?.paddingEnd) })
            .modifyIf(serverModifier?.paddingTop != nil, transform: { $0.padding(.top, serverModifier?.paddingTop) })
            .modifyIf(serverModifier?.paddingBottom != nil, transform: { $0.padding(.bottom, serverModifier?.paddingBottom) })
    }
}

struct SizeViewModifier: ViewModifier {
    var serverModifier: ServerModifier?
    var weight: CGFloat?
    var alignment: Alignment?
    var parentWeightDirection: WeightDirection
    var parentSize: CGFloat
    var parentTotalWeight: CGFloat?
    
    func body(content: Content) -> some View {
        let width = getWidth()
        let height = getHeight()
        
        let fixedWidth = width == .infinity ? nil: width
        let fixedHeight = height == .infinity ? nil: height
        
        let maxWidth: CGFloat? = width == .infinity ? width: nil
        let maxHeight = height == .infinity ? height: nil
        
        return content
            .frame(width: fixedWidth, height: fixedHeight, alignment: alignment ?? .topLeading)
            .frame(maxWidth: maxWidth, maxHeight: maxHeight, alignment: alignment ?? .topLeading)
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
            } else if parentTotalWeight == weight {
                height = .infinity
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
            } else if parentTotalWeight == weight {
                width = .infinity // take available space on other direction if
            }
        }
        // Manually calculate width for aspect ratio if we have manually calculated height and there is no width
        if ignoreAspectRatio == false, let aspectRatio = serverModifier?.aspectRatio, width == nil, let height = getHeight(ignoreAspectRatio: true) {
            width = height * CGFloat(aspectRatio)
        }
        
        return width
    }
}

struct AspectRatioModifier: ViewModifier {
    var serverModifier: ServerModifier?
    func body(content: Content) -> some View {
        content
            .modifyIf(serverModifier?.aspectRatio != nil, transform: {
                // content mode can conflict with the image content mode
                $0.aspectRatio(serverModifier!.wrappedAspectRatio!, contentMode: .fill)
            })
    }
}

struct BackgroundColorViewModifier: ViewModifier {
    var serverModifier: ServerModifier?
    func body(content: Content) -> some View {
        content
            .modifyIf(serverModifier?.backgroundColor != nil, transform: {
                $0.background(Color(UIColor(withHex: serverModifier!.backgroundColor!)))
            })
    }
}

struct CornerRadiusViewModifier: ViewModifier {
    var serverModifier: ServerModifier?
    func body(content: Content) -> some View {
        content
            .modifyIf(serverModifier?.cornerRadius != nil, transform: {
                $0.cornerRadius(CGFloat(serverModifier!.cornerRadius!))
            })
    }
}

struct AccessibilityLabelModifier: ViewModifier {
    var serverModifier: ServerModifier?
    func body(content: Content) -> some View {
        content
            .modifyIf(serverModifier?.adaText != nil, transform: {
                $0
                    .accessibilityElement(children: .ignore) // Ignore the children and read adaText for the whole view
                    .accessibilityLabel(serverModifier!.adaText!)
            })
    }
}

extension View {
    func serverModifier(serverView: ServerView, alignment: Alignment? = nil, parentWeightDirection: WeightDirection, parentSize: CGFloat, parentTotalWeight: CGFloat?) -> some View {
        modifier(ServerViewModifier(serverView: serverView, alignment: alignment, parentWeightDirection: parentWeightDirection, parentSize: parentSize, parentTotalWeight: parentTotalWeight))
    }
    
    func padding(serverModifier: ServerModifier?) -> some View {
        modifier(PaddingViewModifier(serverModifier: serverModifier))
    }

    func size(serverModifier: ServerModifier?, weight: CGFloat?, alignment: Alignment?, parentWeightDirection: WeightDirection, parentSize: CGFloat, parentTotalWeight: CGFloat?) -> some View {
        modifier(SizeViewModifier(serverModifier: serverModifier, weight: weight, alignment: alignment, parentWeightDirection: parentWeightDirection, parentSize: parentSize, parentTotalWeight: parentTotalWeight))
    }
    
    func aspectRatio(serverModifier: ServerModifier?) -> some View {
        modifier(AspectRatioModifier(serverModifier: serverModifier))
    }
    
    func backgroundColor(serverModifier: ServerModifier?) -> some View {
        modifier(BackgroundColorViewModifier(serverModifier: serverModifier))
    }
    
    func cornerRadius(serverModifier: ServerModifier?) -> some View {
        modifier(CornerRadiusViewModifier(serverModifier: serverModifier))
    }
    
    func accessibilityLabel(serverModifier: ServerModifier?) -> some View {
        modifier(AccessibilityLabelModifier(serverModifier: serverModifier))
    }

    @ViewBuilder func modifyIf<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
