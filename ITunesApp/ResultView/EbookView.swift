//
//  EbookView.swift
//  ITunesApp
//
//  Created by 井上智輝 on 2023-04-01.
//

import SwiftUI

struct EbookView: View {
    @ObservedObject var viewModel: SearchViewModel
    @State var isShowDetailView: Bool = false
    @State var imageUrl: String = ""
    @State var smallImageUrl: String = ""
    @State var trackName: String = ""
    @State var artistName: String = ""
    @State var trackUrl: String = ""
    @State var artistUrl: String = ""
    @State var price: String = ""
    @State var description: String = ""
    @State var releaseDate: String = ""
    @State var genres: [String] = []
    @State var userRatingCount: Int = 0
    @State var averageUserRating: Double = 0.0
    let ituens: ITunes
    let screenWidth: Double
    let screenHeight: Double
    
    var body: some View {
        
        List(viewModel.ebookResults!, id: \.self) { result in
            Button {
                sample(imageUrl: result.artworkUrl100,
                       smallImageUrl: result.artworkUrl60,
                       trackName: result.trackName,
                       artistName: result.artistName,
                       price: result.formattedPrice ?? "0",
                       trackUrl: result.trackViewUrl,
                       artistUrl: result.artistViewUrl,
                       description: result.description,
                       releaseDate: result.releaseDate,
                       averageUserRating: result.averageUserRating ?? 0.0,
                       userRatingCount: result.userRatingCount ?? 0,
                       genres: result.genres)
                
                isShowDetailView.toggle()
                
            } label: {
                HStack(alignment: .top) {
                    URLImage(url: result.artworkUrl100,
                             radius: 0.0)
                    .padding(UIDevice.current.userInterfaceIdiom == .phone ? .trailing : [.leading, .trailing])
                    
                    VStack(alignment: .leading) {
                        Text(result.trackName)
                            .padding(.bottom)
                            .lineLimit(2)
                        
                        Text("名：\(result.artistName)")
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
                           collectionName: .constant(nil),
                           trackPrice: Binding($price),
                           collectionPrice: .constant(nil),
                           artistUrl: Binding($artistUrl),
                           trackUrl: Binding($trackUrl),
                           videoUrl: .constant(nil),
                           collectionUrl: .constant(nil),
                           longDescription: Binding($description),
                           primaryGenreName: .constant(nil),
                           releaseDate: $releaseDate,
                           trackTimeMillis: .constant(nil),
                           averageUserRating: Binding($averageUserRating),
                           userRatingCount: Binding($userRatingCount),
                           fileSizeBytes: .constant(nil),
                           languageCodesISO2A: .constant(nil),
                           minimumOsVersion: .constant(nil),
                           releaseNotes: .constant(nil),
                           contentAdvisoryRating: .constant(nil),
                           genres: Binding($genres),
                           itunes: ituens,
                           screenWidth: screenWidth,
                           screenHeight: screenHeight)
            }
        }
    }
    
    func sample(imageUrl: String, smallImageUrl: String, trackName: String,
                artistName: String, price: String, trackUrl: String, artistUrl: String,
                description: String, releaseDate: String, averageUserRating: Double,
                userRatingCount: Int, genres: [String]) {
        self.imageUrl = imageUrl
        self.smallImageUrl = smallImageUrl
        self.trackName = trackName
        self.artistName = artistName
        self.price = price
        self.trackUrl = trackUrl
        self.artistUrl = artistUrl
        self.description = description
        self.releaseDate = releaseDate
        self.averageUserRating = averageUserRating
        self.userRatingCount = userRatingCount
        self.genres = genres
    }
}


//struct EbookView_Previews: PreviewProvider {
//    static var previews: some View {
//        EbookView(viewModel: SearchViewModel())
//    }
//}
