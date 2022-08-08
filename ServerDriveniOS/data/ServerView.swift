//
//  GenericIdentifiable.swift
//  ServerDriveniOS
//
//  Created by David Corrado on 7/6/22.
//

import SwiftUI

protocol ServerView {
    var id: UUID { get }
    var modifier: ServerModifier? { get }
    func getWeight(for direction: WeightDirection, parentDirection: WeightDirection?) -> CGFloat?
}

extension ServerView {
    func getWeight(for direction: WeightDirection, parentDirection: WeightDirection?) -> CGFloat? {
        if let weight = modifier?.weight {
            return weight
        }
        
        guard let weightedContainer = self as? ServerWeightedContainer else {
            return nil
        }
        
        var totalWeight: CGFloat = 0
        let parentDirection = weightedContainer.weightDirection
        for item in weightedContainer.items {
            if let itemWeight = item.getWeight(for: direction, parentDirection: parentDirection) {
                if parentDirection == direction {
                    totalWeight += itemWeight
                }
            }
        }
        
        return totalWeight > 0 ? totalWeight: nil
    }
}
