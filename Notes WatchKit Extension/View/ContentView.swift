//
//  ContentView.swift
//  Notes WatchKit Extension
//
//  Created by Mary Moreira on 24/10/2022.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Properties
    
    @State private var notes: [Note] = []
    @State private var text: String = ""
    
    //MARK: - Function
    
    func save() {
        dump(notes)
    }
    
    //MARK: - Body
    var body: some View {
            VStack {
                HStack(alignment: .center, spacing: 6) {
                    TextField("Add New Note", text: $text)
                    
                    Button {
                        //1. Only run the button's action when textfield is not empty
                        guard !text.isEmpty else { return }
                        
                        //2. create a new note item and initialize it with the next value
                        let note = Note(id: UUID(), text: text)
                        //3. Add the new note item to the notes array
                        
                        notes.append(note)
                        
                        //4. Textfield empty
                        text = ""
                        //5. Save the notes
                        save()
                        
                    } label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 42, weight: .semibold))
                    }
                    .fixedSize()
//                    .buttonStyle(BorderedButtonStyle(tint: .accentColor))
                    .buttonStyle(PlainButtonStyle())
                    .foregroundColor(.accentColor)

                } //: HStack
                Spacer()
                Text("\(notes.count)")
            } //: VStack
            .navigationTitle("Notes")
            .navigationBarTitleDisplayMode(.inline)
    }
}
//MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
