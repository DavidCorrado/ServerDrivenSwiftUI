//
//  ServerWeightedContainer.swift
//  ServerDriveniOS
//
//  Created by Firat Özsarıkamış on 26.07.2022.
//

import SwiftUI

protocol ServerWeightedContainer {
    var spacing: CGFloat? { get }
    var modifier: ServerModifier? { get }
    var items: [ServerView] { get }
    var weightDirection: WeightDirection { get }
    func getTotalWeight(for direction: WeightDirection) -> CGFloat?
}

extension ServerWeightedContainer {
    func getTotalWeight(for direction: WeightDirection) -> CGFloat? {
        var totalWeight: CGFloat = 0
        for item in items {
            if let itemWeight = item.getWeight(for: direction) {
                if weightDirection == direction {
                    totalWeight += itemWeight
                }
            }
        }
        return totalWeight > 0 ? totalWeight: nil
    }
}
