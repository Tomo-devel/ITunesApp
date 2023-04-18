//
//  MusicVideoDetailView.swift
//  ITunesApp
//
//  Created by 井上智輝 on 2023-04-07.
//

import SwiftUI

struct MusicVideoDetailView: View {
    let imageUrl: String
    let artistName: String
    let trackName: String
    let colletionName: String
    let artistUrl: String?
    let trackUrl: String?
    let collectionUrl: String?
    let videoUrl: String?
    let trackPrice: String?
    let collectionPrice: String?
    let releaseDate: String
    let trackTimeMillis: String?
    let primaryGenreName: String
    
    var body: some View {
        
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(trackName)
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    if let artistUrl {
                        NavigationLink {
                            WebView(url: artistUrl)
                            
                        } label: {
                            Label(artistName, systemImage: "chevron.right")
                                .padding(.bottom)
                                .foregroundColor(.black)
                                .labelStyle(ImageAndTextChange(value: artistName))
                        }

                    } else {
                        Text(artistName)
                    }
                    
                    if let trackPrice {
                        Text("￥\(trackPrice)")
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(.systemGray6))
            
            Divider()
            ScrollView {
                if let videoUrl {
                    WebView(url: videoUrl)
                        .aspectRatio(contentMode: .fit)
                }
                
                Divider()
                VStack(alignment: .leading) {
                    Text("情報")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.vertical)
                    
                    Group {
                        HStack(alignment: .top) {
                            Text("タイトル")
                            
                            Spacer()
                            if let trackUrl {
                                NavigationLink {
                                    WebView(url: trackUrl)
                                    
                                } label: {
                                    Label(trackName, systemImage: "chevron.right")
                                        .foregroundColor(.black)
                                        .labelStyle(ImageAndTextChange(value: trackName))
                                }
                                
                            } else {
                                Text(trackName)
                            }
                        }
                        
                        Divider()
                            .padding([.vertical, .leading])
                        
                        HStack(alignment: .top) {
                            Text("アーティスト")
                            
                            Spacer()
                            if let artistUrl {
                                NavigationLink {
                                    WebView(url: artistUrl)
                                    
                                } label: {
                                    Label(artistName, systemImage: "chevron.right")
                                        .foregroundColor(.black)
                                        .labelStyle(ImageAndTextChange(value: artistName))
                                }

                            } else {
                                Text(artistName)
                            }
                        }
                        
                        Divider()
                            .padding([.vertical, .leading])
                        
                        if !colletionName.isEmpty {
                            HStack(alignment: .top) {
                                Text("アルバム")
                                
                                Spacer()
                                if let collectionUrl {
                                    NavigationLink {
                                        WebView(url: collectionUrl)
                                        
                                    } label: {
                                        Label(colletionName, systemImage: "chevron.right")
                                            .foregroundColor(.black)
                                            .labelStyle(ImageAndTextChange(value: colletionName))
                                    }

                                } else {
                                    Text(colletionName)
                                }
                            }
                            
                            Divider()
                                .padding([.vertical, .leading])
                        }
                    }
                    
                    HStack(alignment: .top) {
                        Text("ジャンル")
                        
                        Spacer()
                        Text(primaryGenreName)
                    }
                    
                    Divider()
                        .padding([.vertical, .leading])
                    
                    if let trackPrice,
                       let collectionPrice {
                        HStack(alignment: .top) {
                            Text("価格")
                            
                            Spacer()
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("シングル；")
                                    Text("￥\(trackPrice)")
                                }
                                
                                HStack {
                                    Text("アルバム；")
                                    Text("￥\(collectionPrice)")
                                }
                            }
                        }
                    }
                    
                    Divider()
                        .padding([.vertical, .leading])
                    
                    
                    if let trackTimeMillis {
                        HStack(alignment: .top) {
                            Text("時間")
                            
                            Spacer()
                            Text(trackTimeMillis)
                        }
                    }
                    
                    Divider()
                        .padding([.vertical, .leading])
                    
                    HStack(alignment: .top) {
                        Text("リリース")
                        
                        Spacer()
                        Text(releaseDate)
                    }
                }
            }
            .padding()
        }
        .padding()
    }
}

//struct MusicVideoDetailVIew_Previews: PreviewProvider {
//    static var previews: some View {
//        MusicVideoDetailVIew()
//    }
//}
