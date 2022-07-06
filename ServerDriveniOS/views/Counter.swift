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
        VStack(alignment: .leading) {
            Text("test1")
            HStack(spacing: 0){
                Text("test2")
                Spacer()
                Text("text3")
            }
        }.border(.gray)
    }
}

func counter() -> [GenericIdentifiable] {
    return [ServerColumn(items: [ServerText(text: "test1"),ServerRow(items: [ServerText(text: "test2"),ServerSpacer(),ServerText(text: "test3")])])]
}
