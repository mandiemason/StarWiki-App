//
//  Villager.swift
//  StarWiki App
//
//  Created by Student on 4/21/26.
//

import Foundation

struct Villager: Codable, Identifiable {
    
    var id: String { name }
    
    let name: String
    let birthday: String
    let portrait: String
    
    let lovedGifts: [Gift]
    let likedGifts: [Gift]
    
    let springSchedule: Season
    
}
