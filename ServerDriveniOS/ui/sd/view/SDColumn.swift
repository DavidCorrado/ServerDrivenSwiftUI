//
//  SDColumn.swift
//  ServerDriveniOS
//
//  Created by David Corrado on 7/6/22.
//

import Foundation
import SwiftUI

struct SDColumn: View {
    var items: [GenericIdentifiable]
    var body: some View {
        VStack(alignment: .leading) {
            SDContent(items: items)
        }
    }
}
