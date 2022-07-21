//
//  ServerViewModifier.swift
//  ServerDriveniOS
//
//  Created by David Corrado on 7/6/22.
//

import Foundation
import SwiftUI

struct ServerViewModifier: ViewModifier {
    var serverModifier: ServerModifier?
    func body(content: Content) -> some View {
        content
            .size(serverModifier: serverModifier)
            .backgroundColor(serverModifier: serverModifier)
            .cornerRadius(serverModifier: serverModifier)
            .border(serverModifier: serverModifier)
            .padding(serverModifier: serverModifier)
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
    func body(content: Content) -> some View {
        content
            .modifyIf(serverModifier?.width != nil && serverModifier?.height != nil, transform: {
                $0.frame(width: serverModifier?.width, height: serverModifier?.height, alignment: .topLeading)
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

struct BorderViewModifier: ViewModifier {
    var serverModifier: ServerModifier?
    func body(content: Content) -> some View {
        content
            .modifyIf(serverModifier?.borderColor != nil, transform: {
                $0
                    .padding(.all, max(CGFloat(serverModifier?.borderSize ?? 1) / 2 - 1, 0))
                    .overlay(
                    RoundedRectangle(cornerRadius: CGFloat(serverModifier?.cornerRadius ?? 0))
                        .stroke(Color(UIColor(withHex: serverModifier!.borderColor!)), lineWidth: CGFloat(serverModifier?.borderSize ?? 1))
                )
            })
    }
}

extension View {
    func serverModifier(serverModifier: ServerModifier?) -> some View {
        modifier(ServerViewModifier(serverModifier: serverModifier))
    }
    
    func padding(serverModifier: ServerModifier?) -> some View {
        modifier(PaddingViewModifier(serverModifier: serverModifier))
    }

    func size(serverModifier: ServerModifier?) -> some View {
        modifier(SizeViewModifier(serverModifier: serverModifier))
    }
    
    func backgroundColor(serverModifier: ServerModifier?) -> some View {
        modifier(BackgroundColorViewModifier(serverModifier: serverModifier))
    }
    
    func cornerRadius(serverModifier: ServerModifier?) -> some View {
        modifier(CornerRadiusViewModifier(serverModifier: serverModifier))
    }
    
    func border(serverModifier: ServerModifier?) -> some View {
        modifier(BorderViewModifier(serverModifier: serverModifier))
    }

    @ViewBuilder func modifyIf<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
