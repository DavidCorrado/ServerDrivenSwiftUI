//
//  SDRow.swift
//  ServerDriveniOS
//
//  Created by David Corrado on 7/6/22.
//

import Foundation
import SwiftUI

struct SDRow: View {
    var items: [GenericIdentifiable]
    var body: some View {
        HStack(spacing: 0) {
            SDContent(items: items)
        }
    }
}
