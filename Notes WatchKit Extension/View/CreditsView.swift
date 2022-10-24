//
//  CreditsView.swift
//  Notes WatchKit Extension
//
//  Created by Mary Moreira on 24/10/2022.
//

import SwiftUI

struct CreditsView: View {
    //MARK: - Properties
    
    @State private var randomNumber: Int = Int.random(in: 1..<4)
    
    private var randomImage: String {
        return "developer-no\(randomNumber)"
    }
    
    //MARK: - Body
    var body: some View {
        VStack(spacing: 3) {
            
            //PROFILE IMAGE
            
            Image(randomImage)
                .resizable()
                .scaledToFit()
                .layoutPriority(1)
            
            //HEADER
            
            HeaderView(title: "Credits")
            
            //CONTENT
            
            Text("Marygimm Branco")
                .foregroundColor(.primary)
                .fontWeight(.bold)
            
            Text("Developer")
                .font(.footnote)
                .foregroundColor(.secondary)
                .fontWeight(.light)
        } //: VStack
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
