//
//  HomeView.swift
//  ITunesApp
//
//  Created by 井上智輝 on 2023-03-22.
//

import SwiftUI

enum ITunes: String, CaseIterable {
    case all
    case movie
    case podcast
    case music
    case musicVideo
    case audiobook
    case shortFilm
    case tvShow
    case softWare
    case ebook
    
    
    func changeJP() -> String {
        switch self {
        case .all:
            return "全てから検索"
        case .movie:
            return "映画"
        case .podcast:
            return "ポッドキャスト"
        case .music:
            return "音楽"
        case .musicVideo:
            return "ミュージックビデオ"
        case .audiobook:
            return "オーディオブック"
        case .shortFilm:
            return "ショートフィルム"
        case .tvShow:
            return "TV"
        case .softWare:
            return "アプリケーション"
        case .ebook:
            return "電子書籍"
        }
    }
}

struct HomeView: View {
    @State var selectITunes: ITunes?
    
    var body: some View {
        
        NavigationSplitView {
            List(ITunes.allCases, id: \.self, selection: $selectITunes) { itunes in
                NavigationLink(value: itunes) {
                    Text(itunes.changeJP())
                }
            }
            .navigationTitle("カテゴリー")
            
        } detail: {
            NavigationStack {
                SearchView(media: selectITunes?.rawValue ?? "",
                           category: selectITunes?.changeJP() ?? "",
                           itunes: selectITunes ?? .music)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
