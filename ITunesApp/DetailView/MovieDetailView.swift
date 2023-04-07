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
    let price: Int?
    let videoUrl: String?
    let longDescription: String?
    let primaryGenreName: String
    let releaseDate: String
    let trackTimeMillis: String
    
    var body: some View {
        
        VStack {
            HStack {
                URLImage(url: image, radius: 0.0)
                
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text(artist)
                            .padding(.bottom)
                    
                    if let price {
                        Text("￥\(price)")
                        
                    } else {
                        Text("￥０")
                    }
                }
                .padding(.horizontal)
            }
            .padding(.bottom)
            
            Divider()
            ScrollView {
                VStack(alignment: .leading) {
                    if let videoUrl {
                        Text("予告")
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(.bottom)
                        
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
                
                HStack {
                    VStack(alignment: .trailing) {
                        Text("監督：")
                        Text("ジャンル：")
                        Text("リリース：")
                        Text("再生時間：")
                    }
                    
                    VStack(alignment: .leading) {
                        Text("\(artist)")
                        Text("\(primaryGenreName)")
                        Text("\(releaseDate)")
                        Text("\(trackTimeMillis)")
                    }
                    
                    Spacer()
                }
                .padding()
                
            }
            .padding(.bottom)
        }
    }
}

//struct MovieDeitailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDeitailView()
//    }
//}
