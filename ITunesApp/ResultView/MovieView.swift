//
//  MovieView.swift
//  ITunesApp
//
//  Created by 井上智輝 on 2023-03-29.
//

import SwiftUI

struct MovieView: View {
    @ObservedObject var viewModel: SearchViewModel
    @State var isShowDetailView: Bool = false
    @State var imageUrl: String = ""
    @State var smallImageUrl: String = ""
    @State var trackName: String = ""
    @State var artistName: String = ""
    @State var price: String = ""
    @State var artistUrl: String? = ""
    @State var videoUrl: String? = ""
    @State var longDescription: String = ""
    @State var primaryGenreName: String = ""
    @State var releaseDate: String = ""
    @State var trackTimeMillis: Int = 0
    let screenWidth: Double
    let screenHeight: Double
    let itunes: ITunes
    let columns: [GridItem]
    
    init(viewModel: SearchViewModel,
         screenWidth: Double,
         screenHeigth: Double,
         itunes: ITunes) {
        self.viewModel = viewModel
        self.screenWidth = screenWidth
        self.screenHeight = screenHeigth
        self.itunes = itunes
        self.columns = [GridItem(.fixed(screenWidth / 2)),
                        GridItem(.fixed(screenWidth / 2))]
    }
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(viewModel.movieResults!, id: \.self) { result in
                    Button {
                        sample(imageUrl: result.artworkUrl100,
                               smallImageUrl: result.artworkUrl60,
                               trackName:result.trackName,
                               artistName: result.artistName,
                               price: String(result.trackPrice ?? 0),
                               videoUrl: result.previewUrl,
                               longDescription: result.longDescription,
                               primaryGenreName: result.primaryGenreName,
                               releaseDate: result.releaseDate,
                               trackTimeMillis: result.trackTimeMillis ?? 0)
                        
                        isShowDetailView.toggle()

                    } label: {
                        HStack(alignment: .lastTextBaseline) {
                            VStack {
                                URLImage(url: result.artworkUrl100,
                                         radius: 0.0)

                                if let trackPrice = result.trackPrice {
                                    Text("￥\(trackPrice)")
                                        .padding()

                                } else {
                                    Text("￥０")
                                        .padding()
                                }
                            }

                            VStack(alignment: .leading) {
                                Text("（\(result.primaryGenreName)）")

                                Text(result.trackName)
                                    .lineLimit(3)

                                Spacer()
                                Text(result.artistName)

                                Divider()
                            }
                            .frame(width: screenWidth / 3, alignment: .leading)
                        }
                        .padding()
                    }
                    .buttonStyle(PlainButtonStyle())
                    .sheet(isPresented: $isShowDetailView) {
                        NavigationStack {
                            DetailView(viewModel: viewModel,
                                       isShowDetailView: $isShowDetailView,
                                       imageUrl: $imageUrl,
                                       smallImageUrl: $smallImageUrl,
                                       screenshotUrls: .constant(nil),
                                       ipadScreenshotUrls: .constant(nil),
                                       trackName: $trackName,
                                       artistName: $artistName,
                                       collectionName: .constant(nil),
                                       trackPrice: Binding($price),
                                       collectionPrice: .constant(nil),
                                       artistUrl: .constant(nil),
                                       trackUrl: .constant(nil),
                                       videoUrl: $videoUrl,
                                       collectionUrl: .constant(nil),
                                       longDescription: Binding($longDescription),
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
            }
        }
        .padding()
    }
    
    
    func sample(imageUrl: String, smallImageUrl: String, trackName: String, artistName: String,
                price: String, videoUrl: String?,
                longDescription: String, primaryGenreName: String,
                releaseDate: String, trackTimeMillis: Int) {
        self.imageUrl = imageUrl
        self.smallImageUrl = smallImageUrl
        self.trackName = trackName
        self.artistName = artistName
        self.price = price
        self.artistUrl = artistUrl
        self.videoUrl = videoUrl
        self.longDescription = longDescription
        self.primaryGenreName = primaryGenreName
        self.releaseDate = releaseDate
        self.trackTimeMillis = trackTimeMillis
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView(viewModel: SearchViewModel(),
                  screenWidth: 0.0,
                  screenHeigth: 0.0,
                  itunes: .movie)
    }
}
