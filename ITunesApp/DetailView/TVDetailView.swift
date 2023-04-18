//
//  TVDetailView.swift
//  ITunesApp
//
//  Created by 井上智輝 on 2023-04-07.
//

import SwiftUI

struct TVDetailView: View {
    let imageUrl: String
    let artistName: String
    let trackName: String
    let collectionName: String
    let artistUrl: String?
    let trackUrl: String?
    let collectionUrl: String?
    let releaseDate: String
    let primaryGenreName: String
    let constetAdvisoryRating: String
    let longDescription: String
    
    var body: some View {
        
        VStack {
            HStack {
                URLImage(url: imageUrl,
                         radius: 0.0)
                .padding()
                
                VStack(alignment: .leading) {
                    Text(trackName)
                    
                    if let artistUrl {
                        NavigationLink {
                            WebView(url: artistUrl)
                            
                        } label: {
                            Label(artistName, systemImage: "chevron.right")
                                .labelStyle(ImageAndTextChange(value: artistName))
                                .foregroundColor(.black)
                                .padding(.bottom)
                        }
                    } else {
                        Text(artistName)
                            .padding(.bottom)
                    }
                    
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
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(.systemGray6))
            
            Divider()
            ScrollView {
                VStack(alignment: .leading) {
                    Text("情報")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    Text(longDescription)
                        .padding()
                    
                    Divider()
                    Group {
                        HStack(alignment: .top) {
                            Text("タイトル")
                            
                            Spacer()
                            if let trackUrl {
                                NavigationLink {
                                    WebView(url: trackUrl)
                                    
                                } label: {
                                    Label(trackName, systemImage: "chevron.right")
                                        .labelStyle(ImageAndTextChange(value: trackName))
                                        .foregroundColor(.black)
                                }

                            } else {
                                Text(trackName)
                            }
                        }
                        .padding(.top)
                        
                        Divider()
                            .padding([.vertical, .leading])
                        
                        HStack(alignment: .top) {
                            Text("提供元")
                            
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
                                    .padding(.bottom)
                            }
                        }
                        
                        Divider()
                            .padding([.vertical, .leading])
                        
                        HStack(alignment: .top) {
                            Text("コレクション")
                            
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
                            Text("リリース")
                            
                            Spacer()
                            Text(releaseDate)
                        }
                    }
                }
            }
            .padding()
        }
        .padding()
    }
}

//struct TVDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        TVDetailView()
//    }
//}
