//
//  Counter.swift
//  ServerDriveniOS
//
//  Created by David Corrado on 6/30/22.
//

import Foundation
import SwiftUI

struct Counters_Previews: PreviewProvider {
    static var previews: some View {
        SDContent(items: counter())
    }
}

func counter() -> [GenericIdentifiable] {
    return [ServerText(text: "test2"),ServerText(text: "test3")]
}
