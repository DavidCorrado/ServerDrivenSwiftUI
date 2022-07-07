//
//  SDText.swift
//  ServerDriveniOS
//
//  Created by David Corrado on 7/7/22.
//

import Foundation
import SwiftUI

struct SDText: View {
    var serverText: ServerText
    var body: some View {
        Text(serverText.text).serverModifier(serverModifier: serverText.modifier)
    }
}
