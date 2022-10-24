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
    
    func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    func save() {
        do {
            //1. convert the notes array to data usign JSONEncoder
            let data = try JSONEncoder().encode(notes)
            //2. Create a new url to save the file using the getDocumentDirectory
            let url = getDocumentDirectory().appendingPathComponent("notes")
            //3. Write the data to the given URL
            try data.write(to: url)
        } catch {
            print("saving data has failed!")
        }
    }
    
    func load() {
        DispatchQueue.main.async {
            do {
                //1. Get the notes URL path
                let url = getDocumentDirectory().appendingPathComponent("notes")
                
                //2. Create a new property for the data
                let data = try Data(contentsOf: url)
                
                //3. Decode the data
                
                notes = try JSONDecoder().decode([Note].self, from: data)
            } catch {
                //Do nothing
            }
        }
    }
    
    func delete(offsets: IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offsets)
            save()
        }
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
            if notes.count >= 1 {
                List {
                    ForEach(0..<notes.count, id: \.self) { i in
                        NavigationLink(destination: DetailView(note: notes[i], count: notes.count, index: i)) {
                            HStack {
                                Capsule()
                                    .frame(width: 4)
                                    .foregroundColor(.accentColor)
                                Text(notes[i].text)
                                    .lineLimit(1)
                                    .padding(.leading, 5)
                            }//:Stack
                        } //:Link
                    }//: Loop
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
            }//: List
        } //: VStack
        .navigationTitle("Notes")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            load()
        }
    }
}
//MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
