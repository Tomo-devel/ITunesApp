//
//  SearchResultView.swift
//  ITunesApp
//
//  Created by 井上智輝 on 2023-03-23.
//

import SwiftUI

struct SearchResultView: View {
    @ObservedObject var viewModel: SearchViewModel
    let term: String
    let media: String
    let itunes: ITunes
    
    var body: some View {
        
        VStack {
            switch viewModel.status {
            case .unfinished:
                ProgressView("検索中")
                
            case .succese:
                if viewModel.resultCount != 0 {
                    switch itunes {
                    case .all:
                        Text("aaa")
                        
                    case .movie:
                        List(viewModel.movieResults!, id: \.self) { result in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(result.artistName)
                                        .padding(.bottom)
                                    
                                    Text(result.releaseDate)
                                }
                                .padding()
                                
                                Spacer()
                                if let url = URL(string: result.artworkUrl100) {
                                    AsyncImage(url: url)
                                    
                                } else {
                                    ProgressView()
                                }
                                
                                Spacer()
                            }
                        }
                        
                    case .podcast:
                        List(viewModel.podcastResults!, id: \.self) { result in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(result.trackName)
                                        .padding(.bottom)
                                    
                                    Text(result.releaseDate)
                                }
                                .padding()
                                
                                Spacer()
                                if let url = URL(string: result.artworkUrl100) {
                                    AsyncImage(url: url)
                                    
                                } else {
                                    ProgressView()
                                }
                                
                                Spacer()
                            }
                        }
                        
                    case .music:
                        List(viewModel.musicResults!, id: \.self) { result in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(result.artistName)
                                        .padding(.bottom)
                                    
                                    Text(result.releaseDate)
                                }
                                .padding()
                                
                                Spacer()
                                if let url = URL(string: result.artworkUrl100) {
                                    AsyncImage(url: url)
                                    
                                } else {
                                    ProgressView()
                                }
                                
                                Spacer()
                            }
                        }
                        
                    case .musicVideo:
                        List(viewModel.musicVideoResults!, id: \.self) { result in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(result.artistName)
                                        .padding(.bottom)
                                    
                                    Text(result.releaseDate)
                                }
                                .padding()
                                
                                Spacer()
                                if let url = URL(string: result.artworkUrl100) {
                                    AsyncImage(url: url)
                                    
                                } else {
                                    ProgressView()
                                }
                                
                                Spacer()
                            }
                        }
                        
                    case .audiobook:
                        List(viewModel.audiobookResult!, id: \.self) { result in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(result.artistName)
                                        .padding(.bottom)
                                    
                                    Text(result.releaseDate)
                                }
                                .padding()
                                
                                Spacer()
                                if let url = URL(string: result.artworkUrl100) {
                                    AsyncImage(url: url)
                                    
                                } else {
                                    ProgressView()
                                }
                                
                                Spacer()
                            }
                        }
                        
                    case .tvShow:
                        List(viewModel.tvShowResults!, id: \.self) { result in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(result.artistName)
                                        .padding(.bottom)
                                    
                                    Text(result.releaseDate)
                                }
                                .padding()
                                
                                Spacer()
                                if let url = URL(string: result.artworkUrl100) {
                                    AsyncImage(url: url)
                                    
                                } else {
                                    ProgressView()
                                }
                                
                                Spacer()
                            }
                        }
                        
                    case .software:
                        List(viewModel.softwareResults!, id: \.self) { result in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(result.artistName)
                                        .padding(.bottom)
                                    
                                    Text(result.releaseDate)
                                }
                                .padding()
                                
                                Spacer()
                                if let url = URL(string: result.artworkUrl100) {
                                    AsyncImage(url: url)
                                    
                                } else {
                                    ProgressView()
                                }
                                
                                Spacer()
                            }
                        }
                        
                    case .ebook:
                        List(viewModel.ebookResults!, id: \.self) { result in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(result.artistName)
                                        .padding(.bottom)
                                    
                                    Text(result.releaseDate)
                                }
                                .padding()
                                
                                Spacer()
                                if let url = URL(string: result.artworkUrl100) {
                                    AsyncImage(url: url)
                                    
                                } else {
                                    ProgressView()
                                }
                                
                                Spacer()
                            }
                        }
                    }
                    
                } else {
                    Text("検索した作品は見つかりませんでした。")
                }
               
            case .failded:
                Text("ネットワークにつながりません。")
            }
            
        }
        .navigationTitle(term)
        .task {
            print("itunes: \(itunes)")
            viewModel.search(term: term,
                             media: media,
                             itunes: itunes)
        }
    }
}

struct SearchResultView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultView(viewModel: SearchViewModel(),
                         term: "",
                         media: "",
                         itunes: .all)
    }
}
