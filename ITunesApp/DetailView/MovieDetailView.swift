//
//  MovieDeitailView.swift
//  ITunesApp
//
//  Created by 井上智輝 on 2023-04-06.
//

import SwiftUI

struct MovieDetailView: View {
    let image: String
    let title: String
    let artist: String
    let trackPrice: String?
    let videoUrl: String?
    let longDescription: String?
    let primaryGenreName: String
    let releaseDate: String
    let trackTimeMillis: String
    
    var body: some View {
        
        VStack {
            HStack(alignment: .top) {
                URLImage(url: image, radius: 0.0)
                
                VStack(alignment: .leading) {
                    Text(title)
                        .font(UIDevice.current.userInterfaceIdiom == .phone ? .body : .title2)
                        .fontWeight(.bold)
                    
                    Text(artist)
                            .padding(.bottom)
                    
                    if let trackPrice {
                        Text("￥\(trackPrice)")
                        
                    } else {
                        Text("￥０")
                    }
                }
                .padding(.horizontal)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(.systemGray6))
            
            Divider()
            ScrollView {
                VStack(alignment: .leading) {
                    if let videoUrl {
                        Text("予告")
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        WebView(url: videoUrl)
                            .aspectRatio(contentMode: .fit)
                            .padding()
                        
                        Divider()
                            .padding(.leading)
                    }
                    
                    if let longDescription {
                        Text("作品情報")
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(.bottom)
                        
                        Text(longDescription)
                    }
                }
                .padding()
                
                Divider()
                    .padding(.leading)
                
                VStack {
                    HStack {
                        Text("監督：")
                        
                        Spacer()
                        Text(artist)
                    }
                    
                    HStack {
                        Text("ジャンル：")
                        
                        Spacer()
                        Text(primaryGenreName)
                    }
                    
                    HStack {
                        Text("リリース：")
                        
                        Spacer()
                        Text(releaseDate)
                    }
                    
                    HStack {
                        Text("再生時間：")
                        
                        Spacer()
                        Text(trackTimeMillis)
                    }
                }
                .padding()
            }
            .padding()
        }
        .padding()
    }
}


//struct MovieDeitailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDeitailView()
//    }
//}
