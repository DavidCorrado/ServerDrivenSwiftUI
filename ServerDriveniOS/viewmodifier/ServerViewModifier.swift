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
enum ParentWeightDirection {
    case vertical
    case horizontal
    case other
}

struct ServerViewModifier: ViewModifier {
    var serverModifier: ServerModifier?
    var alignment: Alignment?
    // Parent data, we can combine them into some struct like ParentProperties
    var parentWeightDirection: ParentWeightDirection // Weight growing direction
    var parentSize: CGFloat // Geometry size of the parent, width for .horizontal and height for .vertical
    var parentModifier: ServerModifier? // Need paddings from this for weight size calculations
    func body(content: Content) -> some View {
        content
            .padding(serverModifier: serverModifier)
            .size(serverModifier: serverModifier, alignment: alignment, parentWeightDirection: parentWeightDirection, parentSize: parentSize, parentModifier: parentModifier)
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
    var parentWeightDirection: ParentWeightDirection
    var parentSize: CGFloat
    var parentModifier: ServerModifier?
    func body(content: Content) -> some View {
        content
            .frame(width: getWidth(), height: getHeight(), alignment: alignment ?? .topLeading)
    }
    
    // TODO: Also consider the spacings here like adjustedHeight -= (views.count - 1) * spacing
    private func getHeight() -> CGFloat? {
        var height = serverModifier?.height // Take fixed height first
        // If there is no fixed height, but view has a weight and can grow vertically with weight calculate new height
        if height == nil, let weight = serverModifier?.weight, parentWeightDirection == .vertical {
            height = parentSize * weight // Calculate height from the total height of the parent
            var adjustedHeight = height!
            if let paddingTop = parentModifier?.paddingTop {
                adjustedHeight -= paddingTop // Total height - top padding
            }
            if let paddingBottom = parentModifier?.paddingBottom {
                adjustedHeight -= paddingBottom // Total height - bottom padding
            }
            // Ignore negative values because they can cause layout errors
            // GeometryReader only calculates size for once but SingleAxisGeometryReader calculates it after every size change
            // We need to ignore paddings on first calculations, since they are small values they will create negative sizes
            // And raise errors, they can also crash the app
            if adjustedHeight > 0 {
                height = adjustedHeight
            }
        }
        return height
    }
    
    // TODO: Also consider the spacings here like adjustedWidth -= (views.count - 1) * spacing
    // See getHeight() for descriptions
    private func getWidth() -> CGFloat? {
        var width = serverModifier?.width
        if width == nil, let weight = serverModifier?.weight, parentWeightDirection == .horizontal {
            width = parentSize * weight
            var adjustedWidth = width!
            if let paddingStart = parentModifier?.paddingStart {
                adjustedWidth -= paddingStart
            }
            if let paddingEnd = parentModifier?.paddingEnd {
                adjustedWidth -= paddingEnd
            }
            if adjustedWidth > 0 {
                width = adjustedWidth
            }
        }
        return width
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
    func serverModifier(serverModifier: ServerModifier?, alignment: Alignment? = nil, parentWeightDirection: ParentWeightDirection, parentSize: CGFloat, parentModifier: ServerModifier?) -> some View {
        modifier(ServerViewModifier(serverModifier: serverModifier, alignment: alignment, parentWeightDirection: parentWeightDirection, parentSize: parentSize, parentModifier: parentModifier))
    }
    
    func padding(serverModifier: ServerModifier?) -> some View {
        modifier(PaddingViewModifier(serverModifier: serverModifier))
    }

    func size(serverModifier: ServerModifier?, alignment: Alignment?, parentWeightDirection: ParentWeightDirection, parentSize: CGFloat, parentModifier: ServerModifier?) -> some View {
        modifier(SizeViewModifier(serverModifier: serverModifier, alignment: alignment, parentWeightDirection: parentWeightDirection, parentSize: parentSize, parentModifier: parentModifier))
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
