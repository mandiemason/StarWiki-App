//
//  HomeScreen.swift
//  StarWiki App
//
//  Created by Student on 4/18/26.
//

import Foundation
import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("Menu_Background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack{
                    Text("Villagers or To-Do List")
                        .font(.title)
                        .fontWeight(.bold)
                        .fontDesign(.serif)
                        .foregroundStyle(.white)
                        .shadow(radius: 10)
                        .padding(.bottom, 20)
                        .italic()
                    
                    //Villager Navigation
                    NavigationLink(destination: PickAVillagerScreen()) {
                            VStack {
                                Image("Villager_Icon")
                                    .shadow(radius: 3)
                            }
                            .padding()
                        
                    //To-Do Navigation
                    NavigationLink(destination: ToDoScreen()) {
                            VStack {
                                Image("ToDo_Icon")
                                    .shadow(radius: 3)
                            }
                            .padding()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    HomeScreen()
}
