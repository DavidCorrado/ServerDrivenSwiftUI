//
//  ServerViewModifier.swift
//  ServerDriveniOS
//
//  Created by David Corrado on 7/6/22.
//

import Foundation
import SwiftUI

enum ParentDirection {
    case vertical
    case horizontal
    case other
}

struct ServerViewModifier: ViewModifier {
    var serverModifier: ServerModifier?
    var alignment: Alignment?
    var parentDirection: ParentDirection
    var parentSize: CGSize
    func body(content: Content) -> some View {
        content
            .padding(serverModifier: serverModifier)
            .size(serverModifier: serverModifier, alignment: alignment, parentDirection: parentDirection, parentSize: parentSize)
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
    var parentDirection: ParentDirection
    var parentSize: CGSize
    func body(content: Content) -> some View {
        content
            .frame(width: getWidth(), height: getHeight(), alignment: alignment ?? .topLeading)
    }
    
    private func getHeight() -> CGFloat? {
        var height = serverModifier?.height
        if let weight = serverModifier?.weight, parentDirection == .vertical {
            height = parentSize.height * weight
        }
        return height
    }
    
    private func getWidth() -> CGFloat? {
        var width = serverModifier?.width
        if let weight = serverModifier?.weight, parentDirection == .vertical {
            width = parentSize.width * weight
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
    func serverModifier(serverModifier: ServerModifier?, alignment: Alignment? = nil, parentDirection: ParentDirection, parentSize: CGSize) -> some View {
        modifier(ServerViewModifier(serverModifier: serverModifier, alignment: alignment, parentDirection: parentDirection, parentSize: parentSize))
    }
    
    func padding(serverModifier: ServerModifier?) -> some View {
        modifier(PaddingViewModifier(serverModifier: serverModifier))
    }

    func size(serverModifier: ServerModifier?, alignment: Alignment?, parentDirection: ParentDirection, parentSize: CGSize) -> some View {
        modifier(SizeViewModifier(serverModifier: serverModifier, alignment: alignment, parentDirection: parentDirection, parentSize: parentSize))
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
