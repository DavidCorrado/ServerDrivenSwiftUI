//
//  History.swift
//  ServerDriveniOS
//
//  Created by David Corrado on 7/8/22.
//

import Foundation
import SwiftUI

struct History_Previews: PreviewProvider {
    static var previews: some View {
        SDContent(items: [history1(),history2()])
    }
}

func history1() -> ServerColumn {
    return     ServerColumn(modifier: ServerModifier(paddingStart: 20, paddingEnd: 20, paddingTop: 24, paddingBottom: 24),
                            items:[
                               ServerText(text: "His 1", size: 12, weight: "700")
                            ] )
}
func history2() -> ServerColumn {
    return
        ServerColumn(modifier: ServerModifier(paddingStart: 20, paddingEnd: 20, paddingTop: 24, paddingBottom: 24),
                     items:[
                        ServerText(text: "His 2", size: 12, weight: "700")
                     ] )
}
