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
                Text("test2").padding(.top,50).padding(.leading,50)
                Spacer()
                Text("text3").serverModifier(serverModifier: ServerModifier())
            }
        }.border(.gray)
    }
}

func counters() -> [GenericIdentifiable] {
    return [ServerRow(items: [counter(),counter()])]
}


func counter() -> ServerColumn {
    return ServerColumn(items:
                            [ServerText(text: "test1", modifier: ServerModifier(paddingStart: 18, paddingTop: 18)),
                             ServerRow( modifier: ServerModifier(paddingStart: 18,paddingEnd: 14, paddingBottom: 14),items: [
                                ServerText(text: "test2"),
                                ServerSpacer(),
                                ServerImage(drawableRes: "TotalEntries",
                                            modifier: ServerModifier(paddingStart: 8,     width: 33,
                                                                     height : 33))
                             ])
                            ])
}
