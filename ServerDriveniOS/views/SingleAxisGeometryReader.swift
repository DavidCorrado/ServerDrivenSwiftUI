//
//  SingleAxisGeometryReader.swift
//  ServerDriveniOS
//
//  Created by Firat Özsarıkamış on 26.07.2022.
//
// See https://www.wooji-juice.com/blog/stupid-swiftui-tricks-single-axis-geometry-reader.html
import SwiftUI

// This is working by observing size multiple times
// May need a performance-wise inspection
struct SingleAxisGeometryReader<Content: View>: View {
    private struct SizeKey: PreferenceKey {
        static var defaultValue: CGFloat { 0 }
        static func reduce(value: inout CGFloat, nextValue: () -> CGFloat)
        {
            value = max(value, nextValue())
        }
    }
    
    @State private var size: CGFloat = SizeKey.defaultValue
    
    var axis: Axis = .horizontal
    let content: (CGFloat)->Content
    
    var body: some View {
        content(size)
            .background(GeometryReader
                        {
                proxy in
                Color.clear.preference(key: SizeKey.self, value: axis == .horizontal ? proxy.size.width : proxy.size.height)
            })
            .onPreferenceChange(SizeKey.self) { size = $0 }
            .clipped()
    }
}
