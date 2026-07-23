//
//  ToDoScreen.swift
//  StarWiki App
//
//  Created by Student on 4/19/26.
//


import Foundation
import SwiftUI

struct PickAVillagerScreen: View {
    let villagers = DataLoader.LoadData()
    
    private let columns = [GridItem(.adaptive(minimum: 100))]
    
    var body: some View {
        ZStack {
            Image("Menu_Background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(villagers) { villager in
                    NavigationLink(destination: DisplayVillagerScreen(villager: villager)) {
                        
                        VStack {
                            Image(villager.portrait)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 90, height: 90)
                            
                            Text(villager.name)
                                .font(.title3)
                                .fontWeight(.bold)
                                .fontDesign(.serif)
                                .foregroundStyle(.white)
                                .shadow(radius: 10)
                                .italic()
                        }
                    }
                }
            }
            .padding()
        }
    }
}


#Preview {
    PickAVillagerScreen()
}
