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
    func getDocumentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func save() {
//        dump(notes)
        
        do {
            // 1. convert the notes array to data using jsonEncoder
            let jsonData = try JSONEncoder().encode(notes)
            
            // 2. create a new url to save the file using the getDocumentDirctory
            let url = getDocumentDirectory().appendingPathComponent("notes")
            
            // 3. write the data to the given url
            try jsonData.write(to: url)
        } catch {
            print("Saving Failed: \(error)")
        }
        
    }
    
    func load() {
        DispatchQueue.main.async {
            do {
                // 1. get the notes url path
                let url = getDocumentDirectory().appendingPathComponent("notes")
                // 2. create a new property for the data
                let data = try Data(contentsOf: url)
                // 3. decode the data
                notes = try JSONDecoder().decode([Note].self, from: data)
            } catch {
                print("Loading Failed: \(error)")
            }
        }
    }
    
    func delete(at offsets: IndexSet) {
        withAnimation{
            notes.remove(atOffsets: offsets)
            save()
        }
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
            
            if notes.count >= 1 {
                List {
                    ForEach(0..<notes.count, id: \.self) { i in
                        HStack {
                            Capsule()
                                .frame(width: 4)
                                .foregroundColor(.accentColor)
                            Text(notes[i].text)
                                .lineLimit(1)
                                .padding(.leading, 5)
                        }// : HStack
                    }
                    .onDelete(perform: delete)
                }
            } else {
                Spacer()
                Image(systemName: "note.text")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .opacity(0.25)
                    .padding(25)
                Spacer()
            }
        }//: VStack
        .navigationTitle("Notes")
        .onAppear(perform: {
            load()
        })
    }
}

#Preview {
    ContentView()
}
