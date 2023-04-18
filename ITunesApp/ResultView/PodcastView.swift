//
//  PodcastView.swift
//  ITunesApp
//
//  Created by 井上智輝 on 2023-03-30.
//

import SwiftUI

struct PodcastView: View {
    @ObservedObject var viewModel: SearchViewModel
    @State var isShowDetailView: Bool = false
    @State var imageUrl: String = ""
    @State var smallImageUrl: String = ""
    @State var artistName: String = ""
    @State var trackName: String = ""
    @State var collectionName: String = ""
    @State var trackUrl: String = ""
    @State var collectionUrl: String = ""
    @State var trackPrice: String = ""
    @State var collectionPrice: String = ""
    @State var releaseDate: String = ""
    @State var trackTimeMillis: Int = 0
    @State var genres: [String] = []
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
        
        ScrollView {
            LazyVGrid(columns: columns, alignment: .center) {
                ForEach(viewModel.podcastResults!, id: \.self) { result in
                    Button {
                        sample(imageUrl: result.artworkUrl100,
                               smallImageUrl: result.artworkUrl60,
                               artistName: result.artistName,
                               trackName: result.trackName,
                               collectionName: result.collectionName,
                               trackUrl: result.trackViewUrl ?? "",
                               collectionUrl: result.collectionViewUrl ?? "",
                               trackPrice: String(result.trackPrice),
                               collectionPrice: String(result.collectionPrice),
                               releaseDate: result.releaseDate,
                               trackTimeMillis: result.trackTimeMillis ?? 0,
                               genres: result.genres)
                        
                        isShowDetailView.toggle()
                        
                    } label: {
                        Card(colour: .purple,
                             opacity: 0.2)
                        .overlay {
                            HStack {
                                VStack {
                                    URLImage(url: result.artworkUrl100,
                                             radius: 0.0)
                                    .padding(.top)
                                    
                                    Text("￥\(result.trackPrice)")
                                        .font(.subheadline)
                                        .fontWeight(.bold)
                                        .padding()
                                }
                                .padding(.leading)
                                
                                VStack(alignment: .leading) {
                                    Text("（\(result.primaryGenreName)）")
                                    
                                    Text(result.trackName)
                                        .lineLimit(2)
                                        .font(.headline)
                                        .padding(.bottom)
                                    
                                    Text(result.artistName)
                                        .lineLimit(2)
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
                                   trackPrice: Binding($trackPrice),
                                   collectionPrice: Binding($collectionPrice),
                                   artistUrl: .constant(nil),
                                   trackUrl: Binding($trackUrl),
                                   videoUrl: .constant(nil),
                                   collectionUrl: Binding($collectionUrl),
                                   longDescription: .constant(nil),
                                   primaryGenreName: .constant(nil),
                                   releaseDate: $releaseDate,
                                   trackTimeMillis: Binding($trackTimeMillis),
                                   averageUserRating: .constant(nil),
                                   userRatingCount: .constant(nil),
                                   fileSizeBytes: .constant(nil),
                                   languageCodesISO2A: .constant(nil),
                                   minimumOsVersion: .constant(nil),
                                   releaseNotes: .constant(nil),
                                   contentAdvisoryRating: .constant(nil),
                                   genres: Binding($genres),
                                   itunes: itunes,
                                   screenWidth: screenWidth,
                                   screenHeight: screenHeight)
                    }
                }
            }
        }
    }
    
    func sample(imageUrl: String, smallImageUrl: String, artistName: String, trackName: String,
                collectionName: String, trackUrl: String, collectionUrl: String, trackPrice: String,
                collectionPrice: String, releaseDate: String, trackTimeMillis: Int, genres: [String])  {
        self.imageUrl = imageUrl
        self.smallImageUrl = smallImageUrl
        self.artistName = artistName
        self.trackName = trackName
        self.collectionName = collectionName
        self.trackUrl = trackUrl
        self.collectionUrl = collectionUrl
        self.trackPrice = trackPrice
        self.collectionPrice = collectionPrice
        self.releaseDate = releaseDate
        self.trackTimeMillis = trackTimeMillis
        self.genres = genres
    }
}

struct PodcastView_Previews: PreviewProvider {
    static var previews: some View {
        PodcastView(viewModel: SearchViewModel(),
                    itunes: .podcast,
                    screenWidth: 0.0,
                    screenHeigth: 0.0)
    }
}
