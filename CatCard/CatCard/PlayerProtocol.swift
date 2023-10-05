//
//  PlayerProtocol.swift
//  CatCard
//
//  Created by minsong kim on 2023/10/05.
//

import Foundation

protocol Player {
    var resourceCards: [ResourceType: Int] { get set }
    var catCards: [CatSpecies: Int] { get set }
}

extension Player {
    mutating func addResourceCard(resourceType: ResourceType) {
        guard let card = resourceCards[resourceType] else {
            return
        }
        
        resourceCards[resourceType] = card + 1
    }
    mutating func removeResourceCard(resourceType: ResourceType) {
        guard let card = resourceCards[resourceType] else {
            return
        }
        
        resourceCards[resourceType] = card - 1
    }
    
    mutating func addRandomCatSpeciesCard(catSpecies: CatSpecies) {
        if catSpecies == .tiger {
            biteByTiger()
        } else {
            addCatCard()
        }
    }
    
    mutating func addCatCard() {
        guard let card = catCards[.cat] else {
            return
        }
        
        catCards[.cat] = card + 1
    }
    
    func biteByTiger() {
        
    }
}
