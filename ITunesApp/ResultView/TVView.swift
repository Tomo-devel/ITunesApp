//
//  TVView.swift
//  ITunesApp
//
//  Created by 井上智輝 on 2023-04-01.
//

import SwiftUI

struct TVView: View {
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
    @State var releaseDate: String = ""
    @State var primaryGenreName: String = ""
    @State var constetAdvisoryRating: String = ""
    @State var longDescription: String = ""
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
        self.columns = [GridItem(.fixed(screenWidth / 2)),
                        GridItem(.fixed(screenWidth / 2))]
    }
    
    var body: some View {
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            List(viewModel.tvShowResults!, id: \.self) { result in
                Button {
                    assignment(imageUrl: result.artworkUrl100,
                           smallImageUrl: result.artworkUrl60,
                           artistName: result.artistName,
                           trackName: result.trackName,
                           collectionName: result.collectionName,
                           artistUrl: result.artistViewUrl ?? "",
                           trackUrl: result.trackViewUrl ?? "",
                           collectionUrl: result.collectionViewUrl ?? "",
                           releaseDate: result.releaseDate,
                           primaryGenreName: result.primaryGenreName,
                           constetAdvisoryRating: result.constetAdvisoryRating ?? "",
                           longDescription: result.longDescription)
                    
                    isShowDetailView.toggle()
                    
                } label: {
                    HStack(alignment: .top) {
                        URLImage(url: result.artworkUrl100,
                                 radius: 0.0)
                        .padding(.trailing)

                        VStack(alignment: .leading) {
                            Text("（\(result.primaryGenreName)）")
                            
                            Text(result.trackName)
                                .padding(.bottom)
                            
                            Text(result.artistName)
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
                               trackPrice: .constant(nil),
                               collectionPrice: .constant(nil),
                               artistUrl: Binding($artistUrl),
                               trackUrl: Binding($trackUrl),
                               videoUrl: .constant(nil),
                               collectionUrl: Binding($collectionUrl),
                               longDescription: Binding($longDescription),
                               primaryGenreName: Binding($primaryGenreName),
                               releaseDate: $releaseDate,
                               trackTimeMillis: .constant(nil),
                               averageUserRating: .constant(nil),
                               userRatingCount: .constant(nil),
                               fileSizeBytes: .constant(nil),
                               languageCodesISO2A: .constant(nil),
                               minimumOsVersion: .constant(nil),
                               releaseNotes: .constant(nil),
                               contentAdvisoryRating: Binding($constetAdvisoryRating),
                               genres: .constant(nil),
                               itunes: itunes,
                               screenWidth: screenWidth,
                               screenHeight: screenHeight)
                }
            }
            
        } else {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.tvShowResults!, id: \.self) { result in
                        Button {
                            assignment(imageUrl: result.artworkUrl100,
                                   smallImageUrl: result.artworkUrl60,
                                   artistName: result.artistName,
                                   trackName: result.trackName,
                                   collectionName: result.collectionName,
                                   artistUrl: result.artistViewUrl ?? "",
                                   trackUrl: result.trackViewUrl ?? "",
                                   collectionUrl: result.collectionViewUrl ?? "",
                                   releaseDate: result.releaseDate,
                                   primaryGenreName: result.primaryGenreName,
                                   constetAdvisoryRating: result.constetAdvisoryRating ?? "",
                                   longDescription: result.longDescription)
                            
                            isShowDetailView.toggle()
                            
                        } label: {
                            HStack {
                                URLImage(url: result.artworkUrl100,
                                         radius: 0.0)

                                VStack(alignment: .leading) {
                                    Text("（\(result.primaryGenreName)）")
                                    
                                    Text(result.trackName)
                                        .padding(.bottom)
                                    
                                    Text(result.artistName)
                                }
                                .frame(width: screenWidth / 3, alignment: .leading)

                                Spacer()
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
                                       trackPrice: .constant(nil),
                                       collectionPrice: .constant(nil),
                                       artistUrl: Binding($artistUrl),
                                       trackUrl: Binding($trackUrl),
                                       videoUrl: .constant(nil),
                                       collectionUrl: Binding($collectionUrl),
                                       longDescription: Binding($longDescription),
                                       primaryGenreName: Binding($primaryGenreName),
                                       releaseDate: $releaseDate,
                                       trackTimeMillis: .constant(nil),
                                       averageUserRating: .constant(nil),
                                       userRatingCount: .constant(nil),
                                       fileSizeBytes: .constant(nil),
                                       languageCodesISO2A: .constant(nil),
                                       minimumOsVersion: .constant(nil),
                                       releaseNotes: .constant(nil),
                                       contentAdvisoryRating: Binding($constetAdvisoryRating),
                                       genres: .constant(nil),
                                       itunes: itunes,
                                       screenWidth: screenWidth,
                                       screenHeight: screenHeight)
                        }
                    }
                }
            }
            .padding()
        }
        
    }
    
    func assignment(imageUrl: String, smallImageUrl: String, artistName: String, trackName: String,
                collectionName: String, artistUrl: String, trackUrl: String, collectionUrl: String,
                releaseDate: String, primaryGenreName: String, constetAdvisoryRating: String, longDescription: String) {
        self.imageUrl = imageUrl
        self.smallImageUrl = smallImageUrl
        self.artistName = artistName
        self.trackName = trackName
        self.collectionName = collectionName
        self.artistUrl = artistUrl
        self.trackUrl = trackUrl
        self.collectionUrl = collectionUrl
        self.releaseDate = releaseDate
        self.primaryGenreName = primaryGenreName
        self.constetAdvisoryRating = constetAdvisoryRating
        self.longDescription = longDescription
    }
}

struct TVView_Previews: PreviewProvider {
    static var previews: some View {
        TVView(viewModel: SearchViewModel(),
               itunes: .tvShow,
               screenWidth: 0.0,
               screenHeigth: 0.0)
    }
}
