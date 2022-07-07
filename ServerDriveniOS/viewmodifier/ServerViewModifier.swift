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
        return content
            .padding(.leading,serverModifier?.paddingStart)
            .padding(.trailing,serverModifier?.paddingEnd)
            .padding(.top,serverModifier?.paddingTop)
            .padding(.bottom,serverModifier?.paddingBottom)
    }
}

extension View {
    func serverModifier(serverModifier: ServerModifier?) -> some View {
        modifier(ServerViewModifier(serverModifier: serverModifier))
    }
}
