//
//  Card.swift
//  ITunesApp
//
//  Created by 井上智輝 on 2023-03-30.
//

import SwiftUI

struct Card: View {
    let colour: Color
    let opacity: Double
    
    var body: some View {
        
        colour
            .cornerRadius(16)
            .padding()
            .aspectRatio(2, contentMode: .fill)
            .opacity(opacity)
            .shadow(color: .gray, radius: 3, x: 3, y: 5)
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(colour: Color(.systemGray6),
             opacity: 1)
    }
}
