//
//  User.swift
//  CatCard
//
//  Created by minsong kim on 2023/10/05.
//

import Foundation

struct User: Player {
    var playerType: PlayerType = .user
    var resourceCards: [ResourceType : Int] = [.love: 0, .food: 0, .toy: 0, .time: 0, .money: 0]
    var catCards: [CatSpecies : Int] = [.cat: 0, .tiger: 0]
}
