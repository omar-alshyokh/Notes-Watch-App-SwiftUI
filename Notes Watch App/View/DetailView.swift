//
//  DetailView.swift
//  Notes Watch App
//
//  Created by Omar Alshyokh on 08/09/2025.
//

import SwiftUI

struct DetailView: View {
    //MARK: - PROPERTY
    let note: Note
    let count: Int
    let index: Int
    
    @State private var isCreditPresented: Bool = false
    @State private var isSettingPresented: Bool = false
    //MARK: - FUNCTIONS
    //MARK: - BODY
    var body: some View {
        VStack {
            // Header
            HeaderView(title: "")
            
            // Content
            Spacer()
            ScrollView (.vertical, showsIndicators: false) {
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            } //: Vertical Scroll View
            
            
            // Footer
            Spacer()
            HStack {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .onTapGesture {
                        isSettingPresented.toggle()
                    }
                    .sheet(isPresented: $isSettingPresented) {
                        SettingsView()
                    }
                
                Spacer()
                
                Text("\(count) / \(index + 1)")
                
                Spacer()
                
                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                        isCreditPresented.toggle()
                    }
                    .sheet(isPresented: $isCreditPresented) {
                        CreditsView()
                    }
            }// : HStack
            .foregroundColor(.secondary)
            .padding(3)
        }//: VStack
        .padding(3)
        
    }
}

#Preview {
    let sampleData: Note = .init(id: UUID(), text: "Hello World!")
    DetailView(note: sampleData, count:5, index: 1)
}
