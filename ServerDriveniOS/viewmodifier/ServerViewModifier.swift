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
    var serverModifier: ServerModifier?
    var alignment: Alignment?
    var parentWeightDirection: WeightDirection // Weight filling direction
    var parentSize: CGFloat // Available size of the parent after removing spacings and paddings for supporting weights
    func body(content: Content) -> some View {
        content
            .padding(serverModifier: serverModifier)
            .size(serverModifier: serverModifier, alignment: alignment, parentWeightDirection: parentWeightDirection, parentSize: parentSize)
            .aspectRatio(serverModifier: serverModifier)
            .backgroundColor(serverModifier: serverModifier)
            .cornerRadius(serverModifier: serverModifier)
            .accessibilityLabel(serverModifier: serverModifier)
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
    var alignment: Alignment?
    var parentWeightDirection: WeightDirection
    var parentSize: CGFloat
    func body(content: Content) -> some View {
        content
            .frame(width: getWidth(), height: getHeight(), alignment: alignment ?? .topLeading)
    }
    
    private func getHeight() -> CGFloat? {
        var height = serverModifier?.height // Take fixed height first
        // If there is no fixed height, but view has a weight and can grow vertically with weight calculate new height
        if height == nil, let weight = serverModifier?.weight, parentWeightDirection == .vertical, parentSize > 0 {
            height = parentSize * weight // Calculate height from the available height of the parent
        }
        
        return height
    }
    
    private func getWidth() -> CGFloat? {
        var width = serverModifier?.width
        // If there is no fixed width, but view has a weight and can grow horizontally with weight calculate new height
        if width == nil, let weight = serverModifier?.weight, parentWeightDirection == .horizontal, parentSize > 0 {
            width = parentSize * weight // Calculate width from the available width of the parent
        }
        
        if serverModifier?.aspectRatio == 1.2, serverModifier?.backgroundColor != nil {
            print(width)
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
    func serverModifier(serverModifier: ServerModifier?, alignment: Alignment? = nil, parentWeightDirection: WeightDirection, parentSize: CGFloat) -> some View {
        modifier(ServerViewModifier(serverModifier: serverModifier, alignment: alignment, parentWeightDirection: parentWeightDirection, parentSize: parentSize))
    }
    
    func padding(serverModifier: ServerModifier?) -> some View {
        modifier(PaddingViewModifier(serverModifier: serverModifier))
    }

    func size(serverModifier: ServerModifier?, alignment: Alignment?, parentWeightDirection: WeightDirection, parentSize: CGFloat) -> some View {
        modifier(SizeViewModifier(serverModifier: serverModifier, alignment: alignment, parentWeightDirection: parentWeightDirection, parentSize: parentSize))
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
