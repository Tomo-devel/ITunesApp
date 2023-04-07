//
//  MusicView.swift
//  ITunesApp
//
//  Created by 井上智輝 on 2023-03-30.
//

import SwiftUI

struct MusicView: View {
    @ObservedObject var viewModel: SearchViewModel
    
    var body: some View {
        
        List(viewModel.musicResults!, id: \.self) { result in
            HStack {
                URLImage(url: result.artworkUrl100,
                         radius: 0.0)
                
                VStack(alignment: .leading) {
                    Text(result.trackName)
                        .padding(.bottom)
                    
                    Text("名：\(result.artistName)")
                    
                    Text(result.collectionName)
                        .contextMenu { // TODO: それぞれにURL先にどばす処理
                            Button {
                                
                            } label: {
                                Text("アーティストページ")
                            }
                            
                            Button {
                                
                            } label: {
                                Text("アルバム")
                            }
                        }
                }
                .padding(.leading)
            }
        }
    }
}

struct MusicView_Previews: PreviewProvider {
    static var previews: some View {
        MusicView(viewModel: SearchViewModel())
    }
}
