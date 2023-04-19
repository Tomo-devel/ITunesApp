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
    let screenWidth: Double
    let screenHeight: Double
    let itunes: ITunes
    
    init(viewModel: SearchViewModel,
         term: String,
         media: String,
         screenWidth: Double,
         screenHeight: Double,
         itunes: ITunes) {
        self.viewModel = viewModel
        self.term = term
        self.media = media
        self.screenWidth = screenWidth
        self.screenHeight = screenHeight
        self.itunes = itunes
    }
    
    var body: some View {
        
        VStack {
            switch viewModel.status {
            case .unfinished:
                ProgressView("検索中")
                
            case .succese:
                if viewModel.resultCount != 0 {
                    switch itunes {
                    case .movie:
                        MovieView(viewModel: viewModel,
                                  screenWidth: screenWidth,
                                  screenHeigth: screenHeight,
                                  itunes: itunes)
                        
                    case .tvShow:
                        TVView(viewModel: viewModel,
                               itunes: itunes,
                               screenWidth: screenWidth,
                               screenHeigth: screenHeight)
                        
                    case .podcast:
                        PodcastView(viewModel: viewModel,
                                    itunes: itunes,
                                    screenWidth: screenWidth,
                                    screenHeigth: screenHeight)
                        
                    case .music:
                        MusicView(viewModel: viewModel,
                                  itunes: itunes,
                                  screenWidth: screenWidth,
                                  screenHeight: screenHeight)
                        
                    case .musicVideo:
                        MusicVideoView(viewModel: viewModel,
                                       itunes: itunes,
                                       screenWidth: screenWidth,
                                       screenHeigth: screenHeight)
                        
                    case .software:
                        SoftwareView(viewModel: viewModel,
                                     itunes: itunes,
                                     screenWidth: screenWidth,
                                     screenHeight: screenHeight)
                        
                    case .ebook:
                        EbookView(viewModel: viewModel,
                                  ituens: itunes,
                                  screenWidth: screenWidth,
                                  screenHeight: screenHeight)
                        
                    case .audiobook:
                        AudiobookView(viewModel: viewModel,
                                      itunes: itunes,
                                      screenWidth: screenWidth,
                                      screenHeigth: screenHeight)
                    }
                    
                } else {
                    Text("検索した作品は見つかりませんでした。")
                }
                
            case .failded:
                Text("ネットワークにつながりません。")
            }
        }
        .navigationTitle(term)
        .task { // TODO: 確認用　あとで消す
            print("itunes: \(itunes)")
            print(term)
        }
    }
}

struct SearchResultView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultView(viewModel: SearchViewModel(),
                         term: "",
                         media: "",
                         screenWidth: 0.0,
                         screenHeight: 0.0,
                         itunes: .movie)
    }
}
