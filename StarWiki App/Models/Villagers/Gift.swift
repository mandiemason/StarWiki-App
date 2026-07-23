//
//  Gift.swift
//  StarWiki App
//
//  Created by Student on 4/21/26.
//

import Foundation

struct Gift: Codable, Identifiable {
    
    var id: String { name }
    
    let name: String
    let image: String
}
