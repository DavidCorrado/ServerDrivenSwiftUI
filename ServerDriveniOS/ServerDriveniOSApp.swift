//
//  ServerDriveniOSApp.swift
//  ServerDriveniOS
//
//  Created by David Corrado on 6/30/22.
//

import SwiftUI

@main
struct ServerDriveniOSApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    var body: some View {
        // Normally all VStacks has vertical axis with parentWeightDirection: .vertical and parentSize: height
        // But since this main one is in scroll view only use case of weight is to fill screen horizonyally
        SingleAxisGeometryReader(axis: .horizontal) { width in
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 0) {
                    SDContent(subviews: testing(), parentWeightDirection: .horizontal, parentSize: width, nestedInVerticalLayout: false, nestedInHorizontalLayout: false)
                }
            }
        }
    }
}
