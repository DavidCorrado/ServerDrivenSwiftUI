//
//  ServerSpacer.swift
//  ServerDriveniOS
//
//  Created by David Corrado on 6/30/22.
//

import Foundation

struct ServerSpacer: ServerView  {
    var type: ServerItemType = .SPACER
    var id = UUID()
    var modifier: ServerModifier?
}
