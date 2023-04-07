//
//  SoftwareDetailView.swift
//  ITunesApp
//
//  Created by 井上智輝 on 2023-04-06.
//

import SwiftUI

struct SoftwareDetailView: View {
    let imageUrl: String
    let screenshotUrls: [String]
    let ipadScreenshotUrls: [String]
    let smallImageUrl: String
    let trackName: String
    let artistName: String
    let artistUrl: String
    let averageUserRating: Double
    let userRatingCount: Int
    let fileSizeBytes: String
    let languageCodesISO2A: [String]
    let minimumOsVersion: String
    let description: String
    let releaseNotes: String
    let contentAdvisoryRating: String
    let primaryGenreName: String
    
    var body: some View {
        
        ScrollView {
            VStack {
                HStack(alignment: .center) {
                    URLImage(url: imageUrl, radius: 16.0)
                    
                    VStack(alignment: .leading) {
                        Text(trackName)
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        if let artistUrl {
                            NavigationLink {
                                WebView(url: artistUrl)
                                    .aspectRatio(contentMode: .fit)
                                
                            } label: {
                                Text("\(artistName) >")
                                    .padding(.bottom)
                                    .foregroundColor(.black)
                            }
                            
                        } else {
                            Text(artistName)
                                .padding(.bottom)
                        }
                    }
                    .padding(.horizontal)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(.systemGray6))
                
                Divider()
                
                HStack(alignment: .center) {
                    VStack {
                        Text("\(userRatingCount)件の評価")
                            .font(.caption)
                        
                        Text("\(String(format: "%.1f", round(averageUserRating * 10) / 10))")
                            .font(.headline)
                        
                        HStack {
                            ForEach(0 ..< 5) { _ in
                                Label("rating", systemImage: "star.fill")
                                    .labelStyle(IconOnlyLabelStyle())
                                    .font(.caption)
                            }
                        }
                    }
                    .padding()
                    
                    Divider()
                    VStack() {
                        Text("年齢")
                            .font(.caption)
                        
                        Text(contentAdvisoryRating)
                            .font(.headline)
                    }
                    .padding()
                    
                    Divider()
                    VStack {
                        Text("言語")
                            .font(.caption)
                        
                        Text(languageCodesISO2A.first ?? "")
                        
                        if languageCodesISO2A.count > 1 {
                            Text("その多言語")
                        }
                    }
                    .padding()
                    
                    Divider()
                    VStack {
                        Text("サイズ")
                            .font(.caption)
                        
                        Text("\(fileSizeBytes)")
                    }
                    .padding()
                }
                
                Divider()
                if !screenshotUrls.isEmpty {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(screenshotUrls, id: \.self) { ios in
                                URLImage(url: ios, radius: 0.0)
                                    .padding()
                            }
                        }
                    }
                }
                
                if !ipadScreenshotUrls.isEmpty {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(ipadScreenshotUrls, id: \.self) { ipad in
                                URLImage(url: ipad, radius: 0.0)
                                    .padding()
                            }
                        }
                    }
                }
                
                Divider()
                VStack(alignment: .leading) {
                    Text("情報")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    HStack {
                        Text("販売元")
                            .padding()
                        
                        Spacer()
                        Text(artistName)
                            .padding()
                    }
                    
                    HStack {
                        Text("サイズ")
                            .padding()
                        
                        Spacer()
                        Text(fileSizeBytes)
                            .padding()
                    }
                    
                    HStack {
                        Text("カテゴリ")
                            .padding()
                        
                        Spacer()
                        Text(primaryGenreName)
                            .padding()
                    }
                    
                    HStack {
                        Text("言語")
                            .padding()
                        
                        Spacer()
                        Text(languageCodesISO2A.joined(separator: "、"))
                            .padding()
                    }
                    
                    HStack {
                        Text("対象年齢")
                            .padding()
                        
                        Spacer()
                        Text(contentAdvisoryRating)
                            .padding()
                    }
                }
            }
            .padding()
        }
    }
}

//struct SoftwareDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        SoftwareDetailView()
//    }
//}
