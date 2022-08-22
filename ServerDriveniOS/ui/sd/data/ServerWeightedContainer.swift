//
//  ServerWeightedContainer.swift
//  ServerDriveniOS
//
//  Created by Firat Özsarıkamış on 26.07.2022.
//

import SwiftUI

// This will be .vertical for VStack, horizontal for HStack and outer LazyVStack with a scroll view
// Because weight needs to fill horizontally on scrolling views with a VStack
enum WeightDirection {
    case vertical
    case horizontal
    case none
}

protocol ServerWeightedContainer {
    var spacing: CGFloat? { get }
    var modifier: ServerModifier? { get }
    var subviews: [ServerView] { get }
    var weightDirection: WeightDirection { get }
    func getTotalWeight(for direction: WeightDirection) -> CGFloat?
}

extension ServerWeightedContainer {
    func getTotalWeight(for direction: WeightDirection) -> CGFloat? {
        var totalWeight: CGFloat = 0
        for item in subviews {
            if let itemWeight = item.getWeight(for: direction) {
                if weightDirection == direction {
                    totalWeight += itemWeight
                }
            }
        }
        return totalWeight > 0 ? totalWeight: nil
    }
}
