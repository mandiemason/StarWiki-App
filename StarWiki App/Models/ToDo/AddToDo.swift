//
//  AddToDo.swift
//  StarWiki App
//
//  Created by Student on 4/24/26.
//

import SwiftUI

struct AddToDo: View {
    
    private func commit() {
        let newToDo = ToDo(task: toDo)
        onCommit?(newToDo)
        dismiss()
    }
    
    @State
    private var toDo: String = ""
    
    @Environment(\.dismiss)
    private var dismiss
    
    var onCommit: ((ToDo) -> Void)?
    
    var body: some View {
        NavigationStack{
            Form {
                Section {
                    TextField("Enter Task", text: $toDo)
                }
            }
            .foregroundStyle(Color.black)
            .toolbar{
                ToolbarItem(placement: .principal) {
                    Text("Add A Task")
                        .font(.title3)
                        .fontWeight(.bold)
                        .fontDesign(.serif)
                        .foregroundStyle(.black)
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        commit()
                    }
                    .disabled(toDo.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}


