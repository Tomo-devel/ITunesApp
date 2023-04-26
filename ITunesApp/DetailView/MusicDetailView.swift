//
//  MusicDetailView.swift
//  ITunesApp
//
//  Created by 井上智輝 on 2023-04-07.
//

import SwiftUI

struct MusicDetailView: View {
    let imageUrl: String
    let trackName: String
    let artistName: String
    let collectionName: String?
    let artistUrl: String?
    let collectionUrl: String?
    let videoUrl: String?
    let trackPrice: String
    let collectionPrice: String?
    let releaseDate: String
    let trackTimeMilis: String
    let primaryGenreName: String
    
    var body: some View {
        
        VStack {
            HStack(alignment: .top) {
                URLImage(url: imageUrl,
                         radius: 0.0)
                .padding(.trailing)
                
                VStack(alignment: .leading) {
                    Text(trackName)
                        .font(UIDevice.current.userInterfaceIdiom == .phone ? .body : .title2)
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
                            .padding(.bottom)
                    }
                    
                    Text("￥\(trackPrice)")
                }
                .padding(.trailing)
                .frame(alignment: .center)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(.systemGray6))
            
            Divider()
            ScrollView {
                if let videoUrl {
                    HStack {
                        WebView(url: videoUrl)
                            .aspectRatio(contentMode: .fit)
                            .padding()
                        
                        Spacer()
                    }
                }
                
                Divider()
                    .padding([.vertical, .leading])
                
                VStack(alignment: .leading) {
                    Text("情報")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.bottom)
                    
                    Group {
                        HStack(alignment: .top) {
                            Text("アーティスト")
                            
                            Spacer()
                            if let artistUrl {
                                NavigationLink {
                                    WebView(url: artistUrl)
                                    
                                } label: {
                                    Label(artistName, systemImage: "chevron.right")
                                        .labelStyle(ImageAndTextChange(value: artistName))
                                        .foregroundColor(.black)
                                }

                            } else {
                                Text(artistName)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        
                        Divider()
                            .padding([.vertical, .leading])
                        
                        HStack(alignment: .top) {
                            Text("曲名")
                            
                            Spacer()
                            Text(trackName)
                        }
                        
                        if let collectionName {
                            Divider()
                                .padding([.vertical, .leading])
                            
                            HStack {
                                Text("アルバム")
                                
                                Spacer()
                                if let collectionUrl {
                                    NavigationLink {
                                        WebView(url: collectionUrl)
                                        
                                    } label: {
                                        Label(collectionName, systemImage: "chevron.right")
                                            .labelStyle(ImageAndTextChange(value: collectionName))
                                            .foregroundColor(.black)
                                    }
                                } else {
                                    Text(collectionName)
                                }
                            }
                        }
                        
                        Divider()
                            .padding([.vertical, .leading])
                        
                        HStack(alignment: .top) {
                            Text("ジャンル")
                            
                            Spacer()
                            Text(primaryGenreName)
                        }
                    }
                    
                    Divider()
                        .padding([.vertical, .leading])
                    
                    HStack(alignment: .top) {
                        Text("価格")
                        
                        Spacer()
                        VStack(alignment: .leading) {
                            HStack {
                                Text("シングル；")
                                
                                Text("￥\(trackPrice)")
                            }
                            
                            if let collectionPrice {
                                HStack(alignment: .top) {
                                    Text("アルバム；")
                                    
                                    Text("￥\(collectionPrice)")
                                }
                            }
                        }
                    }
                    
                    Divider()
                        .padding([.vertical, .leading])
                    
                    HStack(alignment: .top) {
                        Text("リリース")
                        
                        Spacer()
                        Text(releaseDate)
                    }
                    
                    Divider()
                        .padding([.vertical, .leading])
                    
                    HStack(alignment: .top) {
                        Text("時間")
                        
                        Spacer()
                        Text(trackTimeMilis)
                    }
                }
                .padding()
            }
        }
        .padding()
    }
}

//struct MusicDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MusicDetailView(imageUrl: <#String#>, trackName: <#String#>, artistName: <#String#>)
//    }
//}
