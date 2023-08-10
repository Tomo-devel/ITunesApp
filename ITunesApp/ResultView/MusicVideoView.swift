//
//  MusicVideoView.swift
//  ITunesApp
//
//  Created by 井上智輝 on 2023-04-01.
//

import SwiftUI

struct MusicVideoView: View {
    @ObservedObject var viewModel: SearchViewModel
    @State var isShowDetailView: Bool = false
    @State var imageUrl: String = ""
    @State var smallImageUrl: String = ""
    @State var artistName: String = ""
    @State var trackName: String = ""
    @State var collectionName: String = ""
    @State var artistUrl: String = ""
    @State var trackUrl: String = ""
    @State var collectionUrl: String = ""
    @State var trackPrice: String = ""
    @State var collectionPrice: String = ""
    @State var videoUrl: String = ""
    @State var releaseDate: String = ""
    @State var trackTimeMillis: Int = 0
    @State var primaryGrenreName: String = ""
    let itunes: ITunes
    let screenWidth: Double
    let screenHeight: Double
    let columns: [GridItem]
    
    init(viewModel: SearchViewModel,
         itunes: ITunes,
         screenWidth: Double,
         screenHeigth: Double) {
        self.viewModel = viewModel
        self.itunes = itunes
        self.screenWidth = screenWidth
        self.screenHeight = screenHeigth
        self.columns = [GridItem(.flexible()),
                        GridItem(.flexible()),
                        GridItem(.flexible())]
    }
    
    var body: some View {
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(viewModel.musicVideoResults!, id: \.self) { result in
                        Button {
                            assignment(imageUrl: result.artworkUrl100,
                                   smallImageUrl: result.artworkUrl60,
                                   artistName: result.artistName,
                                   trackName: result.trackName,
                                   collectionName: result.collectionName ?? "",
                                   artistUrl: result.artistViewUrl ?? "",
                                   trackUrl: result.trackViewUrl ?? "",
                                   collectionUrl: result.collectionViewUrl ?? "",
                                   videoUrl: result.previewUrl ?? "",
                                   trackPrice: String(result.trackPrice ?? 0),
                                   collectonPrice: String(result.collectionPrice ?? 0),
                                   releaseDate: result.releaseDate,
                                   trackTimeMillis: result.trackTimeMillis ?? 0,
                                   primaryGenreName: result.primaryGenreName)
                            
                            isShowDetailView.toggle()
                            
                        } label: {
                            HStack(alignment: .top) {
                                URLImage(url: result.artworkUrl100,
                                         radius: 0.0)
                                
                                VStack(alignment: .leading) {
                                    Text(result.trackName)
                                        .lineLimit(2)
                                    
                                    Text(result.artistName)
                                        .font(.caption)
                                        .lineLimit(1)
                                        .padding(.bottom)
                                }
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
                                       trackUrl: Binding($trackUrl),
                                       videoUrl: Binding($videoUrl),
                                       collectionUrl: Binding($collectionUrl),
                                       longDescription: .constant(nil),
                                       primaryGenreName: Binding($primaryGrenreName),
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
                .padding()
            }
            
        } else {
            ScrollView {
                LazyVGrid(columns: columns, alignment: .center) {
                    ForEach(viewModel.musicVideoResults!, id: \.self) { result in
                        Button {
                            assignment(imageUrl: result.artworkUrl100,
                                   smallImageUrl: result.artworkUrl60,
                                   artistName: result.artistName,
                                   trackName: result.trackName,
                                   collectionName: result.collectionName ?? "",
                                   artistUrl: result.artistViewUrl ?? "",
                                   trackUrl: result.trackViewUrl ?? "",
                                   collectionUrl: result.collectionViewUrl ?? "",
                                   videoUrl: result.previewUrl ?? "",
                                   trackPrice: String(result.trackPrice ?? 0),
                                   collectonPrice: String(result.collectionPrice ?? 0),
                                   releaseDate: result.releaseDate,
                                   trackTimeMillis: result.trackTimeMillis ?? 0,
                                   primaryGenreName: result.primaryGenreName)
                            
                            isShowDetailView.toggle()
                            
                        } label: {
                            VStack {
                                URLImage(url: result.artworkUrl100,
                                         radius: 16)
                                .padding()
                                
                                Text(result.artistName)
                                    .lineLimit(3)
                                
                                Spacer()
                            }
                            .padding()
                            .overlay {
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.pink)
                            }
                            .padding()
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
                                       trackUrl: Binding($trackUrl),
                                       videoUrl: Binding($videoUrl),
                                       collectionUrl: Binding($collectionUrl),
                                       longDescription: .constant(nil),
                                       primaryGenreName: Binding($primaryGrenreName),
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
                .padding()
            }
        }
        
    }
    
    func assignment(imageUrl: String, smallImageUrl: String, artistName: String, trackName: String, collectionName: String,
                artistUrl: String, trackUrl: String, collectionUrl: String, videoUrl: String ,
                trackPrice: String, collectonPrice: String,
                releaseDate: String, trackTimeMillis: Int, primaryGenreName: String) {
        self.imageUrl = imageUrl
        self.smallImageUrl = smallImageUrl
        self.artistName = artistName
        self.trackName = trackName
        self.collectionName = collectionName
        self.artistUrl = artistUrl
        self.trackUrl = trackUrl
        self.collectionUrl = collectionUrl
        self.videoUrl = videoUrl
        self.trackPrice = trackPrice
        self.collectionPrice = collectonPrice
        self.releaseDate = releaseDate
        self.trackTimeMillis = trackTimeMillis
        self.primaryGrenreName = primaryGenreName
    }
}

struct MusicVideoView_Previews: PreviewProvider {
    static var previews: some View {
        MusicVideoView(viewModel: SearchViewModel(),
                       itunes: .musicVideo,
                       screenWidth: 0.0,
                       screenHeigth: 0.0)
    }
}
