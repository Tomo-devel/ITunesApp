//
//  MusicView.swift
//  ITunesApp
//
//  Created by 井上智輝 on 2023-03-30.
//

import SwiftUI

struct MusicView: View {
    @ObservedObject var viewModel: SearchViewModel
    @State var isShowDetailView: Bool = false
    @State var imageUrl: String = ""
    @State var artistName: String = ""
    @State var smallImageUrl: String = ""
    @State var trackName: String = ""
    @State var collectionName: String = ""
    @State var artistUrl: String = ""
    @State var collectionUrl: String = ""
    @State var videoUrl: String = ""
    @State var trackPrice: String = ""
    @State var collectionPrice: String = ""
    @State var releaseDate: String = ""
    @State var primaryGenreName: String = ""
    @State var trackTimeMillis: Int = 0
    let itunes: ITunes
    let screenWidth: Double
    let screenHeight: Double
    
    var body: some View {
        
        List(viewModel.musicResults!, id: \.self) { result in
            Button {
                sample(imageUrl: result.artworkUrl100,
                       smallImageUrl: result.artworkUrl30,
                       trackName: result.trackName,
                       artistName: result.artistName,
                       collectionName: result.collectionName ?? "",
                       trackPrice: String(result.trackPrice ?? 0),
                       collectionPrice: String(result.collectionPrice ?? 0),
                       artistUrl: result.artistViewUrl ?? "",
                       videoUrl: result.previewUrl ?? "",
                       collectionUrl: result.collectionViewUrl ?? "",
                       primaryGenreName: result.primaryGenreName,
                       releaseDate: result.releaseDate,
                       trackTimeMillis: result.trackTimeMillis)
                print("Button: \(result.releaseDate)")
                print("Button2: \(releaseDate)")
                
                isShowDetailView.toggle()
                
            } label: {
                HStack {
                    URLImage(url: result.artworkUrl100,
                             radius: 0.0)
                    
                    VStack(alignment: .leading) {
                        Text(result.trackName)
                            .padding(.bottom)
                        
                        Text("名：\(result.artistName)")
                        
                        if let collectionName = result.collectionName {
                            Text(collectionName)
                                .contextMenu { // TODO: それぞれにURL先にどばす処理
                                    NavigationLink {
                                        WebView(url: result.artistViewUrl ?? "時間をあけてもう一度お試しください")
                                        
                                    } label: {
                                        Text("アーティストページ")
                                    }
                                    
                                    NavigationLink {
                                        WebView(url: result.collectionViewUrl ?? "時間をあけてもう一度お試しください")
                                        
                                    } label: {
                                        Text("アルバム")
                                    }
                                }
                        }
                    }
                    .padding(.leading)
                }
            }
            .buttonStyle(.plain)
            .sheet(isPresented: $isShowDetailView) {
                DetailView(viewModel: viewModel,
                           isShowDetailView: $isShowDetailView,
                           imageUrl: $imageUrl,
                           smallImageUrl: $smallImageUrl,
                           screenshotUrls: .constant(nil),
                           ipadScreenshotUrls: .constant(nil),
                           trackName: $trackName,
                           artistName: $artistName,
                           collectionName: Binding($collectionName),
                           trackPrice: Binding($trackPrice),
                           collectionPrice: Binding($collectionPrice),
                           artistUrl: Binding($artistUrl),
                           trackUrl: .constant(nil),
                           videoUrl: Binding($videoUrl),
                           collectionUrl: Binding($collectionUrl),
                           longDescription: .constant(nil),
                           primaryGenreName: Binding($primaryGenreName),
                           releaseDate: $releaseDate,
                           trackTimeMillis: Binding($trackTimeMillis),
                           averageUserRating: .constant(nil),
                           userRatingCount: .constant(nil),
                           fileSizeBytes: .constant(nil),
                           languageCodesISO2A: .constant(nil),
                           minimumOsVersion: .constant(nil),
                           releaseNotes: .constant(nil),
                           contentAdvisoryRating: .constant(nil),
                           genres: .constant(nil),
                           itunes: itunes,
                           screenWidth: screenWidth,
                           screenHeight: screenHeight)
            }
        }
    }
    
    func sample(imageUrl: String, smallImageUrl: String, trackName: String, artistName: String, collectionName: String,
                trackPrice: String, collectionPrice: String, artistUrl: String, videoUrl: String, collectionUrl: String,
                primaryGenreName: String, releaseDate: String, trackTimeMillis: Int) {
        self.imageUrl = imageUrl
        self.smallImageUrl = smallImageUrl
        self.trackName = trackName
        self.artistName = artistName
        self.collectionName = collectionName
        self.trackPrice = trackPrice
        self.collectionPrice = collectionPrice
        self.artistUrl = artistUrl
        self.videoUrl = videoUrl
        self.collectionUrl = collectionUrl
        self.primaryGenreName = primaryGenreName
        self.releaseDate = releaseDate
        self.trackTimeMillis = trackTimeMillis
    }
}

//struct MusicView_Previews: PreviewProvider {
//    static var previews: some View {
//        MusicView(viewModel: SearchViewModel(),
//                  itunes: <#ITunes#>)
//    }
//}
