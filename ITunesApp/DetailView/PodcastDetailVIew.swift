//
//  PodcastDetailView.swift
//  ITunesApp
//
//  Created by 井上智輝 on 2023-04-07.
//

import SwiftUI

struct PodcastDetailView: View {
    let imageUrl: String
    let artistName: String
    let trackName: String
    let collectionName: String
    let trackUrl: String?
    let collectionUrl: String?
    let trackPrice: String
    let collectionPrice: String
    let releaseDate: String
    let trackTimeMillis: String?
    let genres: [String]
    
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
                    
                    Text(artistName)
                        .padding(.bottom)
                    
                    Text("￥\(trackPrice)")
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
                        .padding(.bottom)
                    
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
                    
                    Divider()
                        .padding([.vertical, .leading])
                    
                    HStack(alignment: .top) {
                        Text("提供元")
                        
                        Spacer()
                        Text(artistName)
                    }
                    
                    Divider()
                        .padding([.vertical, .leading])
                    
                    HStack(alignment: .top) {
                        Text("価格")
                        
                        Spacer()
                        Text("￥\(trackPrice)")
                    }
                    
                    Divider()
                        .padding([.vertical, .leading])
                    
                    HStack(alignment: .top) {
                        Text("ジャンル")
                        
                        Spacer()
                        VStack(alignment: .leading) {
                            ForEach(genres, id: \.self) { genre in
                                Text(genre)
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
                }
            }
            .padding()
        }
        .padding()
    }
}

//struct PodcastDetailVIew_Previews: PreviewProvider {
//    static var previews: some View {
//        PodcastDetailVIew()
//    }
//}
