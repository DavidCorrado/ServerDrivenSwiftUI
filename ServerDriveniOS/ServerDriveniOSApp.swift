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
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 0) {
                SDContent(items: testing())
            }
        }
    }
}
