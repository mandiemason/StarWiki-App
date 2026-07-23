//
//  ContentView.swift
//  StarWiki App
//
//  Created by Student on 4/17/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("Menu_Background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    Image("Logo_Filled")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 370)
                        .shadow(radius: 10)
                    
                    Text("Wiki Companion")
                        .font(.title)
                        .fontWeight(.bold)
                        .fontDesign(.serif)
                        .foregroundStyle(.white)
                        .shadow(radius: 10)
                        .padding(.bottom, 80)
                        .italic()
                    
                    //HomeScreen Navigation
                    NavigationLink(destination: HomeScreen()) {
                        VStack {
                            Text("Get Started")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                                .padding(.top, 60)
                        }
                        .padding()
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
