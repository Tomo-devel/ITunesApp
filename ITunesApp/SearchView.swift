//
//  SearchView.swift
//  ITunesApp
//
//  Created by 井上智輝 on 2023-03-22.
//

import SwiftUI

// TODO: Viewが長くなりそうだったら別Viewに分ける
// TODO: HOMEViewを作る

struct SearchView: View {
    @StateObject var viewModel: SearchViewModel = SearchViewModel()
    @State private var term: String = ""
    @State private var isInitialization: Bool = false
    @Binding var isSearch: Bool
    let categoryArray: [ITunes]
    let media: String
    let category: String
    let itunes: ITunes
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                switch viewModel.status {
                case .succese:
                    switch itunes {
                    case .all:
                        Text("aaa")
                        
                    case .movie:
                        ScrollView {
                            ScrollView(.horizontal) {
                                HStack {
                                    ForEach(viewModel.movieResults!, id: \.self) { result in
                                        VStack {
                                            if let url = URL(string: result.artworkUrl100) {
                                                AsyncImage(url: url)
                                                
                                            } else {
                                                ProgressView()
                                            }
                                            
                                            Text(result.trackName)
                                        }
                                    }
                                }
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
                        
                    case .software:
                        List(viewModel.softwareResults!, id: \.self) { result in
                            Text(result.trackName)
                        }
                        
                    case .ebook:
                        List(viewModel.ebookResults!, id: \.self) { result in
                            Text(result.trackName)
                        }
                    case .audiobook:
                        List(viewModel.audiobookResult!, id: \.self) { result in
                            VStack(alignment: .leading) {
                                Text(result.artistName)
                                    .padding(.bottom)
                                
                                Text(result.collectionName)
                            }
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
                                 screenWidth: geometry.size.width,
                                 screenHeight: geometry.size.height,
                                 itunes: itunes)
            }
            .searchable(text: $term)
            .onSubmit(of: .search) {
                isSearch = true
                print("term: \(term)、media: \(media)、itunes: \(itunes)")
                viewModel.search(term: term, media: media, itunes: itunes)
            }
            .task {
                print("itunes: \(itunes) *******")
                
                if !isInitialization {
                    print("上")
                    viewModel.initialSearch(categoryArray: categoryArray,
                                            term: "Apple")
                    isInitialization = true
                    
                } else {
                    print("した")
                    viewModel.search(term: "Apple",
                                     media: media,
                                     itunes: itunes)
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(isSearch: .constant(false),
                   categoryArray: [],
                   media: "",
                   category: "",
                   itunes: .all)
    }
}
