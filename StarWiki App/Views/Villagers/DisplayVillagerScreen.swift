//
//  DisplayVillagerScreen.swift
//  StarWiki App
//
//  Created by Student on 4/19/26.
//

import Foundation
import SwiftUI

struct DisplayVillagerScreen: View {
    let villager: Villager
    
    @State private var SelectedDay: Int = 1
    
    private let columns = [GridItem(.adaptive(minimum: 32), spacing: 8)]
    
    var body: some View {
        ZStack {
            Image("Menu_Background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                VStack(spacing: 16) {
                    HStack(alignment: .center) {
                        VStack {
                            Text(villager.name)
                                .font(.title)
                                .fontWeight(.bold)
                                .fontDesign(.serif)
                                .foregroundStyle(.white)
                                .shadow(radius: 10)
                                .italic()
                            
                            Text("Birthday: \(villager.birthday)")
                                .font(.headline)
                                .fontWeight(.bold)
                                .fontDesign(.serif)
                                .foregroundStyle(.white)
                        }
                        
                        Image(villager.portrait)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120)
                    }
                    
                    VStack(spacing: 12) {
                        Text("Loved Gifts:")
                            .font(.headline)
                            .fontWeight(.bold)
                            .fontDesign(.serif)
                            .foregroundStyle(.white)
                        
                        //lazy grid to wrap, trades being able to center
                        LazyVGrid(columns: columns, spacing: 8) {
                            ForEach(villager.lovedGifts) { gift in
                                Image(gift.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .padding(2)
                            }
                        }
                        .padding(.horizontal, 18)
                        .clipped()
                        
                        Text("Liked Gifts:")
                            .font(.headline)
                            .fontWeight(.bold)
                            .fontDesign(.serif)
                            .foregroundStyle(.white)
                            .padding(.top, 8)
                        
                        LazyVGrid(columns: columns, spacing: 8) {
                            ForEach(villager.likedGifts) { gift in
                                Image(gift.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .padding(2)
                            }
                        }
                        .padding(.horizontal, 18)
                        .clipped()
                    }
                }
                .padding(.top, 40)
                
                VStack(spacing: 12) {
                    HStack {
                        Button {
                            if SelectedDay > 1 { SelectedDay -= 1 } //keeps day from going below 1
                        } label: {
                            Image(systemName: "chevron.left.circle.fill")
                                .font(.title2)
                                .foregroundStyle(.white)
                        }
                        
                        Text("Spring \(SelectedDay)")
                            .font(.title2)
                            .fontWeight(.bold)
                            .fontDesign(.serif)
                            .foregroundStyle(.white)
                            .padding(.bottom, 12)
                        
                        Button {
                            if SelectedDay < 28 { SelectedDay += 1 } //keeps day from going past 28
                        } label: {
                            Image(systemName: "chevron.right.circle.fill")
                                .font(.title2)
                                .foregroundStyle(.white)
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 6) {
                        let events = PrioritizingSchedule(for: SelectedDay, season: villager.springSchedule)
                        
                        if events.isEmpty {
                            Text("No events scheduled for this day.") // display this if no events
                                .foregroundColor(.white)
                        } else {
                            // display each event in time - locaiton format
                            ForEach(events) { event in
                                HStack(alignment: .top) {
                                    Text(event.time)
                                        .font(.system(size: 14))
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    
                                    Text(event.location)
                                        .font(.system(size: 14))
                                        .fontDesign(.serif)
                                        .foregroundColor(.white)
                                        .lineLimit(2)
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                                .padding(.vertical, 2)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 26)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
    }
}
