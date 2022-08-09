//
//  ServerViewModifier.swift
//  ServerDriveniOS
//
//  Created by David Corrado on 7/6/22.
//

import Foundation
import SwiftUI

struct ServerViewModifier: ViewModifier {
    var serverView: ServerView
    var alignment: Alignment?
    var parentWeightDirection: WeightDirection // Weight filling direction
    var parentSize: CGFloat // Available size of the parent after removing spacings and paddings for supporting weights
    var parentTotalWeight: CGFloat?
    var nestedInVerticalLayout: Bool
    var nestedInHorizontalLayout: Bool
    
    func body(content: Content) -> some View {
        content
            .padding(serverModifier: serverView.modifier)
            .size(serverView: serverView, serverModifier: serverView.modifier, weight: serverView.getWeight(for: parentWeightDirection), alignment: alignment, parentWeightDirection: parentWeightDirection, parentSize: parentSize, parentTotalWeight: parentTotalWeight, nestedInVerticalLayout: nestedInVerticalLayout, nestedInHorizontalLayout: nestedInHorizontalLayout)
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
    func serverModifier(serverView: ServerView, alignment: Alignment? = nil, parentWeightDirection: WeightDirection, parentSize: CGFloat, parentTotalWeight: CGFloat?, nestedInVerticalLayout: Bool, nestedInHorizontalLayout: Bool) -> some View {
        modifier(ServerViewModifier(serverView: serverView, alignment: alignment, parentWeightDirection: parentWeightDirection, parentSize: parentSize, parentTotalWeight: parentTotalWeight, nestedInVerticalLayout: nestedInVerticalLayout, nestedInHorizontalLayout: nestedInHorizontalLayout))
    }
    
    func padding(serverModifier: ServerModifier?) -> some View {
        modifier(PaddingViewModifier(serverModifier: serverModifier))
    }

    func size(serverView: ServerView, serverModifier: ServerModifier?, weight: CGFloat?, alignment: Alignment?, parentWeightDirection: WeightDirection, parentSize: CGFloat, parentTotalWeight: CGFloat?, nestedInVerticalLayout: Bool, nestedInHorizontalLayout: Bool) -> some View {
        modifier(SizeViewModifier(serverView: serverView, serverModifier: serverModifier, weight: weight, alignment: alignment, parentWeightDirection: parentWeightDirection, parentSize: parentSize, parentTotalWeight: parentTotalWeight, nestedInVerticalLayout: nestedInVerticalLayout, nestedInHorizontalLayout: nestedInHorizontalLayout))
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
