//
//  AudiobookView.swift
//  ITunesApp
//
//  Created by 井上智輝 on 2023-03-31.
//

import SwiftUI

struct AudiobookView: View {
    @ObservedObject var viewModel: SearchViewModel
    @State var isShowDetailView: Bool = false
    @State var imageUrl: String = ""
    @State var smallImageUrl: String = ""
    @State var trackName: String = ""
    @State var collectionName: String = ""
    @State var artistName: String = ""
    @State var collectionUrl: String = ""
    @State var artistUrl: String = ""
    @State var videoUrl: String = ""
    @State var collectionPrice: String = ""
    @State var releaseDate: String = ""
    @State var primaryGenreName: String = ""
    @State var description: String = ""
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
                        GridItem(.flexible())]
    }
    
    var body: some View {
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            List(viewModel.audiobookResult!, id: \.self) { result in
                Button {
                    assignment(imageUrl: result.artworkUrl100,
                           smallImageUrl: result.artworkUrl60,
                           trackName: "",
                           collectionName: result.collectionName,
                           artistName: result.artistName,
                           collectionUrl: result.collectionViewUrl ?? "",
                           artistUrl: result.artistViewUrl ?? "",
                           videoUrl: result.previewUrl ?? "",
                           collectionPrice: String(result.collectionPrice),
                           releaseDate: result.releaseDate,
                           primaryGenreName: result.primaryGenreName,
                           description: result.description)
                    
                    isShowDetailView.toggle()
                    
                } label: {
                    HStack(alignment: .top) {
                        URLImage(url: result.artworkUrl100,
                                 radius: 0.0)
                        .padding(.trailing)
                        
                        VStack(alignment: .leading) {
                            Text(result.collectionName)
                                .lineLimit(2)
                                .padding(.bottom)
                            
                            Text("名：\(result.artistName)")
                                .lineLimit(2)
                        }
                    }
                }
                .buttonStyle(PlainButtonStyle())
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
                               trackPrice: .constant(nil),
                               collectionPrice: Binding($collectionPrice),
                               artistUrl: Binding($artistUrl),
                               trackUrl: .constant(nil),
                               videoUrl: Binding($videoUrl),
                               collectionUrl: Binding($collectionUrl),
                               longDescription: Binding($description),
                               primaryGenreName: Binding($primaryGenreName),
                               releaseDate: $releaseDate,
                               trackTimeMillis: .constant(nil),
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
            
        } else {
            ScrollView {
                LazyVGrid(columns: columns, alignment: .center) {
                    ForEach(viewModel.audiobookResult!, id: \.self) { result in
                        Button {
                            assignment(imageUrl: result.artworkUrl100,
                                   smallImageUrl: result.artworkUrl60,
                                   trackName: "",
                                   collectionName: result.collectionName,
                                   artistName: result.artistName,
                                   collectionUrl: result.collectionViewUrl ?? "",
                                   artistUrl: result.artistViewUrl ?? "",
                                   videoUrl: result.previewUrl ?? "",
                                   collectionPrice: String(result.collectionPrice),
                                   releaseDate: result.releaseDate,
                                   primaryGenreName: result.primaryGenreName,
                                   description: result.description)
                            
                            isShowDetailView.toggle()
                            
                        } label: {
                            Card(colour: .orange,
                                 opacity: 0.2)
                                .overlay {
                                    HStack {
                                        VStack {
                                            URLImage(url: result.artworkUrl100,
                                                     radius: 10.0)
                                            .padding(.top)
                                            
                                            Text("￥\(result.collectionPrice)")
                                                .font(.subheadline)
                                                .fontWeight(.bold)
                                                .padding()
                                        }
                                        .padding(.leading)
                                        
                                        VStack(alignment: .leading) {
                                            Text("（\(result.primaryGenreName)）")
                                            
                                            Text(result.collectionName)
                                                .lineLimit(2)
                                                .font(.headline)
                                                .padding(.bottom)

                                            Text(result.artistName)
                                                .lineLimit(3)
                                        }
                                        .padding()
                                        .frame(width: screenWidth / 3, alignment: .leading)
                                    }
                                    .padding([.leading, .trailing])
                                    .scaledToFill()
                                }
                                .clipped()
                        }
                        .buttonStyle(PlainButtonStyle())
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
                                       trackPrice: .constant(nil),
                                       collectionPrice: Binding($collectionPrice),
                                       artistUrl: Binding($artistUrl),
                                       trackUrl: .constant(nil),
                                       videoUrl: Binding($videoUrl),
                                       collectionUrl: Binding($collectionUrl),
                                       longDescription: Binding($description),
                                       primaryGenreName: Binding($primaryGenreName),
                                       releaseDate: $releaseDate,
                                       trackTimeMillis: .constant(nil),
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
            }
        }
    }
    
    func assignment(imageUrl: String, smallImageUrl: String, trackName: String, collectionName: String,
                artistName: String, collectionUrl: String, artistUrl: String,
                videoUrl: String, collectionPrice: String, releaseDate: String,
                primaryGenreName: String, description: String) {
        self.imageUrl = imageUrl
        self.smallImageUrl = smallImageUrl
        self.trackName = trackName
        self.collectionName = collectionName
        self.artistName = artistName
        self.collectionUrl = collectionUrl
        self.artistUrl = artistUrl
        self.videoUrl = videoUrl
        self.collectionPrice = collectionPrice
        self.releaseDate = releaseDate
        self.primaryGenreName = primaryGenreName
        self.description = description
    }
}

struct AudiobookView_Previews: PreviewProvider {
    static var previews: some View {
        AudiobookView(viewModel: SearchViewModel(),
                      itunes: .audiobook,
                      screenWidth: 0.0,
                      screenHeigth: 0.0)
    }
}
