//
//  SearchView.swift
//  ITunesApp
//
//  Created by 井上智輝 on 2023-03-22.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel: SearchViewModel = SearchViewModel()
    @State var term: String = ""
    @State var isSearch: Bool = false
    let media: String
    let category: String
    let itunes: ITunes
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                switch viewModel.status {
                case .succese:
                    switch itunes {
                    case .all:
                        Text("aaa")
                        
                    case .movie:
                        List(viewModel.movieResults!, id: \.self) { result in
                            VStack(alignment: .leading) {
                                Text(result.trackName)
                                    .padding(.bottom)
                                
                                Text(result.artistName)
                            }
                        }
                        
                    case .podcast:
                        List(viewModel.podcastResults!, id: \.self) { result in
                            VStack(alignment: .leading) {
                                Text(result.trackName)
                                    .padding(.bottom)
                                
                                Text(result.collectionName)
                            }
                        }
                        
                    case .music:
                        List(viewModel.musicResults!, id: \.self) { result in
                            VStack(alignment: .leading) {
                                Text(result.trackName)
                                    .padding(.bottom)
                                
                                Text(result.artistName)
                            }
                        }
                        
                    case .musicVideo:
                        List(viewModel.musicVideoResults!, id: \.self) { result in
                            VStack(alignment: .leading) {
                                Text(result.trackName)
                                    .padding(.bottom)
                                
                                Text(result.artistName)
                            }
                        }
                        
                    case .audiobook:
                        List(viewModel.audiobookResult!, id: \.self) { result in
                            VStack(alignment: .leading) {
                                Text(result.artistName)
                                    .padding(.bottom)
                                
                                Text(result.collectionName)
                            }
                        }
                        
                    case .tvShow:
                        List(viewModel.tvShowResults!, id: \.self) { result in
                            VStack(alignment: .leading) {
                                Text(result.artistName)
                                    .padding(.bottom)
                                
                                Text(result.collectionName)
                            }
                        }
                        
                    case .software:
                        List(viewModel.softwareResults!, id: \.self) { result in
                            Text(result.trackName)
                        }
                        
                    case .ebook:
                        List(viewModel.ebookResults!, id: \.self) { result in
                            Text(result.trackName)
                        }
                    }
                    
                case .failded:
                    Text("ネットワークに繋がりません")
                    
                case .unfinished:
                    HStack {
                        Spacer()
                        ProgressView("検索中")
                        
                        Spacer()
                    }
                    
                    Spacer()
                }
            }
            .navigationTitle(category)
            .navigationDestination(isPresented: $isSearch) {
                SearchResultView(viewModel: viewModel,
                                 term: term,
                                 media: media,
                                 itunes: itunes)
            }
            .toolbar{
                TextField("検索", text: $term, onCommit: {
                    isSearch = true
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(minWidth: geometry.size.width / 3)
            }
            .task {
                print("itunes: \(itunes) *******")
                viewModel.search(term: "Apple",
                                 media: media,
                                 itunes: itunes)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(media: "",
                   category: "",
                   itunes: .all)
    }
}
