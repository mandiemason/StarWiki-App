//
//  DataLoader.swift
//  StarWiki App
//
//  Created by Student on 4/21/26.
//

import Foundation

final class DataLoader {
    static func LoadData() -> [Villager] {
        print("Data loader active.")
        
        guard let url = Bundle.main.url(forResource: "villagers", withExtension: "JSON") else {
            print("Could not find villagers.JSON")
            return[]
        }
        
        print("Found villagers.JSON")
        
        do {
            let data = try Data(contentsOf: url)
            let villagers = try JSONDecoder().decode([Villager].self, from: data)
            
            print("Loaded villagers.JSON")
            return villagers
            
        } catch {
            print("Failed to load villagers.JSON", error.localizedDescription)
            return[]
        }
    }
}
