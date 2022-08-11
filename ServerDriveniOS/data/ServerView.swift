//
//  GenericIdentifiable.swift
//  ServerDriveniOS
//
//  Created by David Corrado on 7/6/22.
//

import SwiftUI

protocol ServerView: Decodable {
    var id: UUID { get }
    var type: ServerItemType { get }
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

/*enum ServerViewData {
    var view: ServerView {
}

extension ServerViewData: Decodable {
    private enum CodingKeys: String, CodingKey {
        case type
        case view
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        
        switch type {
        case ServerItemType.BOX.rawValue:
            self = try? decoder.singleValueContainer().decode(ServerBox.self)
        default:
            fatalError("Unsupported")
        }
    }
}*/




/*enum ServerItemType: String, Decodable {
    case TEXT
    case SPACER
    case CARD
    case ROW
    case COLUMN
    case BOX
    case IMAGE
    case BUBBLE
}*/
