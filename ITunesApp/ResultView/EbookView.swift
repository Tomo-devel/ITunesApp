//
//  EbookView.swift
//  ITunesApp
//
//  Created by 井上智輝 on 2023-04-01.
//

import SwiftUI

struct EbookView: View {
    @ObservedObject var viewModel: SearchViewModel
    
    var body: some View {
        
        List(viewModel.ebookResults!, id: \.self) { result in
            HStack {
                URLImage(url: result.artworkUrl100,
                         radius: 0.0)
                .padding([.leading, .trailing])
                
                VStack(alignment: .leading) {
                    Text(result.trackName)
                        .padding(.bottom)
                    
                    Text("名：\(result.artistName)")
                }
                
            }
        }
    }
}

struct EbookView_Previews: PreviewProvider {
    static var previews: some View {
        EbookView(viewModel: SearchViewModel())
    }
}
