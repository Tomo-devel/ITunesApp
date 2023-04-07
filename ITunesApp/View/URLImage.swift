//
//  URLImage.swift
//  ITunesApp
//
//  Created by 井上智輝 on 2023-03-31.
//

import SwiftUI

struct URLImage: View {
    let url: String
    let radius: Double
    
    var body: some View {
        
        AsyncImage(url: URL(string: url)) { phase in
            if let image = phase.image {
                image
                    .cornerRadius(radius)
                    .shadow(radius: 3, x: 3, y: 5)
                
            } else if let error = phase.error {
                Text(error.localizedDescription)
                
            } else {
                ProgressView()
            }
        }
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url: "",
                 radius: 0.0)
    }
}
