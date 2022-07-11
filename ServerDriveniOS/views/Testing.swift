//
//  Testing.swift
//  ServerDriveniOS
//
//  Created by David Corrado on 7/11/22.
//

import Foundation
import SwiftUI
struct Testing_Previews: PreviewProvider {
    static var previews: some View {
        HStack{
            Text("test")
            Image("Disappointed").resizable().frame(width: 24, height: 22).padding(.trailing,20).padding(.leading,20)
            Text("test2")
        }
    }
}
