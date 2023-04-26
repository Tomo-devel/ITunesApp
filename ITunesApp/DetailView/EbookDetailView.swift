//
//  EbookDetailView.swift
//  ITunesApp
//
//  Created by 井上智輝 on 2023-04-07.
//

import SwiftUI

struct EbookDetailView: View {
    let imageUrl: String
    let artistName: String
    let trackName: String
    let artistUrl: String
    let trackUrl: String
    let price: String
    let description: String
    let releaseDate: String
    let genres: [String]
    let userRatingCount: Int?
    let averageUserRating: Double?
    let screenWidth: Double
    let screenHeight: Double
    
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
                    
                    NavigationLink {
                        WebView(url: artistUrl)
                        
                    } label: {
                        Label(artistName, systemImage: "chevron.right")
                            .labelStyle(ImageAndTextChange(value: artistName))
                            .foregroundColor(.black)
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
                        .padding(.bottom)
                    
                    Text(description)
                    
                    Divider()
                        .padding()
                    
                    VStack {
                        HStack(alignment: .top) {
                            Text("タイトル")
                            
                            Spacer()
                            NavigationLink {
                                WebView(url: trackUrl)
                                
                            } label: {
                                Label(trackName, systemImage: "chevron.right")
                                    .labelStyle(ImageAndTextChange(value: artistName))
                                    .foregroundColor(.black)
                            }
                        }
                        
                        Divider()
                            .padding([.vertical, .leading])
                        
                        HStack(alignment: .top) {
                            Text("著者")
                            
                            Spacer()
                            NavigationLink {
                                WebView(url: artistUrl)
                                
                            } label: {
                                Label(artistName, systemImage: "chevron.right")
                                    .labelStyle(ImageAndTextChange(value: artistName))
                                    .foregroundColor(.black)
                            }
                        }
                        
                        Divider()
                            .padding([.vertical, .leading])
                        
                        HStack(alignment: .top) {
                            Text("ジャンル")
                            
                            Spacer()
                            VStack(alignment: .leading) {
                                ForEach(genres, id: \.self) { genres in
                                    Text("\(genres)")
                                }
                            }
                        }
                        
                        Divider()
                            .padding([.vertical, .leading])
                        
                        HStack(alignment: .top) {
                            Text("価格")
                            
                            Spacer()
                            Text("\(price)")
                        }
                        
                        if let userRatingCount,
                        let averageUserRating {
                            Divider()
                                .padding([.vertical, .leading])
                            
                            HStack(alignment: .top) {
                                Text("評価")
                                
                                Spacer()
                                VStack(alignment: .center) {
                                    Text("\(userRatingCount)件の評価")
                                    
                                    Text("\(String(format: "%.1f", round(averageUserRating * 10) / 10))")
                                    
                                    HStack {
                                        ForEach(0 ..< 5) { star in
                                            RatingStar(rating: Decimal(averageUserRating),
                                                       colour: .black,
                                                       star: star)
                                            .frame(width: screenWidth / 50, height: screenHeight / 50)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .padding()
    }
}

//struct EbookDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        EbookDetailView()
//    }
//}
