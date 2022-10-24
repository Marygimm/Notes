//
//  HeaderView.swift
//  Notes WatchKit Extension
//
//  Created by Mary Moreira on 24/10/2022.
//

import SwiftUI

struct HeaderView: View {
    //MARK: - Properties
    
    var title: String = ""
    //MARK: - Body
    var body: some View {
        VStack {
            
            //TITLE
            if !title.isEmpty {
                Text(title.uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
            }
            //SEPARATOR
            HStack{
                Capsule()
                    .frame(height: 1)
                
                Image(systemName: "note.text")
                
                Capsule()
                    .frame(height: 1)
            }//: HStack
            .foregroundColor(.accentColor)
        }//:VStack
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeaderView(title: "Credits")
            HeaderView()
        }
    }
}
