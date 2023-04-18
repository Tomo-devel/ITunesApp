//
//  AudiobookDetailView.swift
//  ITunesApp
//
//  Created by 井上智輝 on 2023-04-07.
//

import SwiftUI

struct AudiobookDetailView: View {
    let imageUrl: String
    let collectionName: String
    let artistName: String
    let collectionUrl: String?
    let artistUrl: String?
    let videoUrl: String?
    let collectionPrice: String
    let releaseDate: String
    let primaryGenreName: String
    let description: String
    
    var body: some View {
        
        VStack {
            HStack {
                URLImage(url: imageUrl,
                         radius: 0.0)
                .padding()
                
                VStack(alignment: .leading) {
                    Text(collectionName)
                    
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
                    
                    Text("￥\(collectionPrice)")
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
                        .padding()
                }
                
                Divider()
                VStack(alignment: .leading) {
                    Text("情報")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding()
                    
                    HStack(alignment: .top) {
                        Text("タイトル")
                        
                        Spacer()
                        if let collectionUrl {
                            NavigationLink {
                                WebView(url: collectionUrl)
                                
                            } label: {
                                Label(collectionName, systemImage: "chevron.right")
                                    .foregroundColor(.black)
                                    .labelStyle(ImageAndTextChange(value: artistName))
                            }

                        } else {
                            Text(collectionName)
                        }
                    }
                    
                    Divider()
                        .padding([.vertical, .leading])
                    
                    HStack {
                        Text("著者")
                        
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
                    
                    HStack(alignment: .top) {
                        Text("ジャンル")
                        
                        Spacer()
                        Text(primaryGenreName)
                    }
                    
                    Divider()
                        .padding([.vertical, .leading])
                    
                    HStack(alignment: .top) {
                        Text("価格")
                        
                        Spacer()
                        Text("￥\(collectionPrice)")
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

//struct AudiobookDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        AudiobookDetailView()
//    }
//}
