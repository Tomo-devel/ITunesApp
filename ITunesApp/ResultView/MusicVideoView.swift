//
//  MusicVideoView.swift
//  ITunesApp
//
//  Created by 井上智輝 on 2023-04-01.
//

import SwiftUI

struct MusicVideoView: View {
    @ObservedObject var viewModel: SearchViewModel
    let screenWidth: Double
    let columns: [GridItem]
    
    init(viewModel: SearchViewModel,
         screenWidth: Double) {
        self.viewModel = viewModel
        self.screenWidth = screenWidth
        self.columns = [GridItem(.flexible()),
                        GridItem(.flexible()),
                        GridItem(.flexible())]
    }
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: columns, alignment: .center) {
                ForEach(viewModel.musicVideoResults!, id: \.self) { result in
                    Button {
                        // TODO: 詳細に遷移する処理
                    } label: {
                        VStack {
                            Card(colour: Color.gray, opacity: 0.3)
                                .overlay {
                                    URLImage(url: result.artworkUrl100,
                                             radius: 16)
                                    .scaleEffect(1.5)
                                }
                        }
                    }
                }
            }
        }
    }
}

struct MusicVideoView_Previews: PreviewProvider {
    static var previews: some View {
        MusicVideoView(viewModel: SearchViewModel(),
                       screenWidth: 0.0)
    }
}
