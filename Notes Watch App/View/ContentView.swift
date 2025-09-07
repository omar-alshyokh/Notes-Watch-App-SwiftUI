//
//  ContentView.swift
//  Notes Watch App
//
//  Created by Omar Alshyokh on 07/09/2025.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTY
    
    @State private var notes: [Note] = []
    @State private var text: String = ""
    
    
    //MARK: - FUNCTIONS
    func save() {
        dump(notes)
    }
    //MARK: - BODY
    var body: some View {
        VStack {
            
            HStack(alignment: .center, spacing: 6) {
                
                TextField("Add new Note", text: $text)
                
                Button {
                    // 1. only run the button action when the text feild is not empty
                    guard text.isEmpty == false else { return }
                    
                    // 2. create a new item and initalize it with text value
                    let note = Note(id: UUID(), text: text)
                    
                    // 3. add the new note item to the notes array
                    notes.append(note)
                    
                    // 4. make the text field empty
                    text = ""
                    
                    // 5. save the notess
                    save()
                } label: {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 42, weight: .semibold))
                } //: BUTTON
                .fixedSize()
//                .buttonStyle(BorderedButtonStyle(tint: .accentColor))
                .buttonStyle(PlainButtonStyle())
                .foregroundColor(.accentColor)
                
            }// : HStack
            
            Spacer()
            
            Text("\(notes.count)")
        }//: VStack
        .navigationTitle("Notes")
    }
}

#Preview {
    ContentView()
}
