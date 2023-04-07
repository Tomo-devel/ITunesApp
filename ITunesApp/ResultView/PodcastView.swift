//
//  PodcastView.swift
//  ITunesApp
//
//  Created by 井上智輝 on 2023-03-30.
//

import SwiftUI

struct PodcastView: View {
    @ObservedObject var viewModel: SearchViewModel
    let screenWidth: Double
    let columns: [GridItem]
    
    init(viewModel: SearchViewModel,
         screenWidth: Double) {
        self.viewModel = viewModel
        self.screenWidth = screenWidth
        self.columns = [GridItem(.flexible()),
                        GridItem(.flexible())]
    }
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: columns, alignment: .center) {
                ForEach(viewModel.podcastResults!, id: \.self) { result in
                    Button {
                        // TODO: 詳細に遷移する処理
                    } label: {
                        Card(colour: .purple,
                             opacity: 0.2)
                            .overlay {
                                HStack {
                                    VStack {
                                        URLImage(url: result.artworkUrl100,
                                                     radius: 0.0)
                                        .padding(.top)
                                        
                                        Text("￥\(result.trackPrice)")
                                            .font(.subheadline)
                                            .fontWeight(.bold)
                                            .padding()
                                    }
                                    .padding(.leading)
                                    
                                    VStack(alignment: .leading) {
                                        Text("（\(result.primaryGenreName)）")
                                        
                                        Text(result.collectionName)
                                            .lineLimit(2)
                                            .font(.headline)
                                            .padding(.bottom)

                                        Text(result.artistName)
                                            .lineLimit(2)
                                    }
                                    .padding()
                                    .frame(width: screenWidth / 3, alignment: .leading)
                                }
                                .padding([.leading, .trailing])
                                .scaledToFill()
                            }
                            .clipped()
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}

struct PodcastView_Previews: PreviewProvider {
    static var previews: some View {
        PodcastView(viewModel: SearchViewModel(),
                    screenWidth: 0.0)
    }
}
