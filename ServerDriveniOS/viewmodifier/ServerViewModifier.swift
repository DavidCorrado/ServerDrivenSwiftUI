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
            .backgroundColor(serverModifier: serverView.modifier)
            .cornerRadius(serverModifier: serverView.modifier)
            .accessibilityLabel(serverModifier: serverView.modifier)
    }
}

struct PaddingViewModifier: ViewModifier {
    var serverModifier: ServerModifier?
    func body(content: Content) -> some View {
        content
            .modifyIf(serverModifier?.spacingStart != nil, transform: { $0.padding(.leading, serverModifier?.spacingStart) })
            .modifyIf(serverModifier?.spacingEnd != nil, transform: { $0.padding(.trailing, serverModifier?.spacingEnd) })
            .modifyIf(serverModifier?.spacingTop != nil, transform: { $0.padding(.top, serverModifier?.spacingTop) })
            .modifyIf(serverModifier?.spacingBottom != nil, transform: { $0.padding(.bottom, serverModifier?.spacingBottom) })
    }
}

struct BackgroundColorViewModifier: ViewModifier {
    var serverModifier: ServerModifier?
    func body(content: Content) -> some View {
        if let backgroundColor = serverModifier?.backgroundColor{
            content
                .background(Color(UIColor(withHex: backgroundColor)))
        } else {
            content
        }
    }
}

struct CornerRadiusViewModifier: ViewModifier {
    var serverModifier: ServerModifier?
    func body(content: Content) -> some View {
        if let cornerRadius = serverModifier?.cornerRadius {
            content
                .cornerRadius(CGFloat(cornerRadius))
        } else {
            content
        }
    }
}

struct AccessibilityLabelModifier: ViewModifier {
    var serverModifier: ServerModifier?
    func body(content: Content) -> some View {
        if let adaText = serverModifier?.adaText {
            content
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(adaText)
        } else {
            content
        }
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
