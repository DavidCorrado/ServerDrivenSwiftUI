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
    func getWeight(for direction: WeightDirection) -> CGFloat?
}

extension ServerView {
    func getWeight(for direction: WeightDirection) -> CGFloat? {
        if let weight = modifier?.weight {
            return weight
        }
        
        guard let weightedContainer = self as? ServerWeightedContainer else {
            return nil
        }
        
        return weightedContainer.getTotalWeight(for: direction)
    }
}
