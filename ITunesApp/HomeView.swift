//
//  HomeView.swift
//  ITunesApp
//
//  Created by 井上智輝 on 2023-03-22.
//

import SwiftUI

enum ITunes: String, CaseIterable {
    case movie
    case tvShow
    case podcast
    case music
    case musicVideo
    case software
    case ebook
    case audiobook
    
    
    func changeJP() -> (String, String) {
        switch self {
        case .movie:
            return ("映画", "popcorn")
        case .tvShow:
            return ("TV", "tv")
        case .podcast:
            return ("ポッドキャスト", "radio")
        case .music:
            return ("音楽", "music.note.list")
        case .musicVideo:
            return ("ミュージックビデオ", "music.note.tv")
        case .software:
            return ("アプリケーション", "arrow.down.app")
        case .ebook:
            return ("電子書籍", "book")
        case .audiobook:
            return ("オーディオブック", "headphones")
        }
    }
}

struct HomeView: View {
    @State private var selectITunes: ITunes?
    @State var isSearch: Bool = false
    @State var isShowSettingView: Bool = false
    
    var body: some View {
        
        NavigationSplitView {
            VStack(spacing: 1) {
                
                if UIDevice.current.userInterfaceIdiom == .phone {
                    List(selection: $selectITunes) {
                        ForEach(ITunes.allCases, id: \.self) { itunes in
                            NavigationLink(value: itunes) {
                                Label(itunes.changeJP().0, systemImage: itunes.changeJP().1)
                                    .foregroundColor(.black)
                            }
                        }
                        
                        Spacer()
                        Text("おすすめ")
                            .font(.title3)
                            .fontWeight(.bold)
                            .listRowSeparator(.hidden)
                        
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(0 ..< 10) { _ in
                                    Button {
                                        
                                    } label: {
                                        RoundedRectangle(cornerRadius: 20)
                                            .frame(width: 100, height: 100)
                                    }
                                }
                            }
                        }
                        .listRowSeparator(.hidden)
                        
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(0 ..< 10) { _ in
                                    Button {
                                        
                                    } label: {
                                        RoundedRectangle(cornerRadius: 20)
                                            .frame(width: 100, height: 100)
                                    }
                                }
                            }
                            
                        }
                        .listRowSeparator(.hidden)
                        
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(0 ..< 10) { _ in
                                    Button {
                                        
                                    } label: {
                                        RoundedRectangle(cornerRadius: 20)
                                            .frame(width: 100, height: 100)
                                    }
                                }
                            }
                            
                        }
                        .listRowSeparator(.hidden)
                    }
                   
                    
                } else {
                    List(ITunes.allCases, id: \.self, selection: $selectITunes) { itunes in
                        NavigationLink(value: itunes) {
                            Label(itunes.changeJP().0, systemImage: itunes.changeJP().1)
                                .foregroundColor(.black)
                        }
                    }
                }
            }
            .disabled(isSearch)
            .navigationTitle(UIDevice.current.userInterfaceIdiom == .phone ? "Search" : "カテゴリー")
            .toolbar {
                ToolbarItem {
                    Button {
                        isShowSettingView.toggle()
                        
                    } label: {
                        Label("setting", systemImage: "gearshape")
                    }
                    .sheet(isPresented: $isShowSettingView) {
                        NavigationStack {
                            SettingView(isShowSettingView: $isShowSettingView)
                        }
                    }
                }
            }
            
            
        } detail: {
            NavigationStack {
                SearchView(isSearch: $isSearch,
                           categoryArray: ITunes.allCases,
                           media: selectITunes?.rawValue ?? "all",
                           category: selectITunes?.changeJP().0 ?? "HOME",
                           itunes: selectITunes ?? .movie)
            }
        }
        .preferredColorScheme(.light)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
