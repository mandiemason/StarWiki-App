//
//  ToDoScreen.swift
//  StarWiki App
//
//  Created by Student on 4/19/26.
//

import Foundation
import SwiftUI

struct ToDoScreen: View {
    @State var ToDos: [ToDo] = []
    @State var ToDoPresented: Bool = false
    
    private func PresentToDo(){
        ToDoPresented.toggle()
    }
    
    var body: some View {
        ZStack {
            Image("Menu_Background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("To-Do List")
                    .font(.title)
                    .fontWeight(.bold)
                    .fontDesign(.serif)
                    .foregroundStyle(.white)
                    .shadow(radius: 10)
                    .italic()
                    .padding(.top, 80)
                
                //give a checkbox to each task
                VStack(alignment: .leading, spacing: 12) {
                    ForEach($ToDos) { $todo in
                        HStack {
                            Image(systemName: todo.isCompleted ? "checkmark.square.fill" : "square")
                                .onTapGesture { todo.isCompleted.toggle() }
                            
                            Text(todo.task)
                        }
                        .foregroundStyle(.white)
                    }
                }
                .padding(.horizontal)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        // Add button on the left side of the toolbar
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: PresentToDo) {
                    Image(systemName: "plus.circle")
                }
            }
        }
        // sheet to type in todo task and add
        .sheet(isPresented: $ToDoPresented) {
            AddToDo { newToDo in
                ToDos.append(newToDo)
            }
        }
    }
}

#Preview {
    ToDoScreen()
}

