//
//  SoftwareView.swift
//  ITunesApp
//
//  Created by 井上智輝 on 2023-03-31.
//

import SwiftUI

struct SoftwareView: View {
    @ObservedObject var viewModel: SearchViewModel
    @State var isShowDetailView: Bool = false
    @State var imageUrl: String = ""
    @State var smallImageUrl: String = ""
    @State var screenshotUrls: [String] = []
    @State var ipadScreenshotUrls: [String] = []
    @State var trackName: String = ""
    @State var artistName: String = ""
    @State var price: Int = 0
    @State var artistUrl: String = ""
    @State var description: String = ""
    @State var primaryGenreName: String = ""
    @State var releaseDate: String = ""
    @State var averageUserRating: Double = 0.0
    @State var userRatingCount: Int = 0
    @State var fileSizeBytes: String = ""
    @State var languageCodesISO2A: [String] = []
    @State var minimumOsVersion: String = ""
    @State var releaseNotes: String = ""
    @State var contentAdvisoryRating: String = ""
    let itunes: ITunes
    let screenWidth: Double
    let columns: [GridItem]
    
    init(viewModel: SearchViewModel,
         itunes: ITunes,
         screenWidth: Double) {
        self.viewModel = viewModel
        self.itunes = itunes
        self.screenWidth = screenWidth
        self.columns = [GridItem(.flexible()),
                        GridItem(.flexible())]
    }
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: columns, alignment: .center) {
                ForEach(viewModel.softwareResults!, id: \.self) { result in
                    Button {
                        print("*******\(result.artistViewUrl)")
                        sample(imageUrl: result.artworkUrl100, smallImageUrl: result.artworkUrl60,
                               screenshotUrls: result.screenshotUrls ?? [], ipadScreenshotUrls: result.ipadScreenshotUrls ?? [],
                               trackName: result.trackName, artistName: result.artistName,
                               price: result.price ?? 0, artistUrl: result.artistViewUrl, videoUrl: nil, description: result.description,
                               primaryGenreName: result.primaryGenreName, releaseDate: result.releaseDate,
                               averageUserRating: result.averageUserRating, userRatingCount: result.userRatingCount,
                               fileSizeBytes: result.fileSizeBytes, languageCodesISO2A: result.languageCodesISO2A,
                               minimumOsVersion: result.minimumOsVersion!, releaseNotes: result.releaseNotes ?? "",
                               contentAdvisoryRating: result.contentAdvisoryRating)
                        
                        print(artistUrl)
                        
                        isShowDetailView.toggle()
                        
                    } label: {
                        Card(colour: Color(.systemGray6),
                             opacity: 1)
                            .overlay {
                                HStack {
                                    VStack {
                                        URLImage(url: result.artworkUrl100,
                                                 radius: 16.0)
                                            .padding(.top)
                                        
                                        HStack {
                                            Text("年齢")
                                                .font(.callout)
                                            
                                            Text("\(result.contentAdvisoryRating)")
                                                .fontWeight(.bold)
                                                .font(.subheadline)
                                        }
                                        .padding()
                                    }
                                    .padding(.leading)
                                    
                                    VStack(alignment: .leading) {
                                        Text(result.trackName)
                                            .lineLimit(2)
                                            .font(.headline)
                                            .fontWeight(.semibold)
                                        
                                        Text(result.artistName)
                                            .lineLimit(1)
                                            .font(.caption2)
                                            .padding(.bottom)
                                        
                                        Text("\(result.userRatingCount)件の評価")
                                            .font(.body)
                                        
                                        Text("\(String(format: "%.1f", round(result.averageUserRating * 10) / 10))")
                                            .font(.subheadline)
                                            .fontWeight(.bold)
                                        
                                        HStack {
                                            ForEach(0 ..< 5) { _ in
                                                Label("rating", systemImage: "star.fill")
                                                    .labelStyle(IconOnlyLabelStyle())
                                                    .font(.caption)
                                            }
                                        }
                                    }
                                    .padding()
                                    .frame(width: screenWidth / 3, alignment: .leading)
                                }
                                .padding()
                                .scaledToFill()
                            }
                            .clipped()
                    }
                    .buttonStyle(PlainButtonStyle())
                    .sheet(isPresented: $isShowDetailView) {
                        DetailView(viewModel: viewModel, isShowDetailView: $isShowDetailView, itunes: itunes,
                                   imageUrl: imageUrl, smallImageUrl: smallImageUrl, screenshotUrls: screenshotUrls,
                                   ipadScreenshotUrls: ipadScreenshotUrls, trackName: trackName,
                                   artistName: artistName, price: price, artistUrl: artistUrl,
                                   videoUrl: nil, longDescription: description, primaryGenreName: primaryGenreName,
                                   releaseDate: releaseDate, trackTimeMillis: nil, averageUserRating: averageUserRating,
                                   userRatingCount: userRatingCount, fileSizeBytes: fileSizeBytes, languageCodesISO2A: languageCodesISO2A,
                                   minimumOsVersion: minimumOsVersion, releaseNotes: releaseNotes,
                                   contentAdvisoryRating: contentAdvisoryRating)
                    }
                }
            }
        }
    }
    
    
    func sample(imageUrl: String, smallImageUrl: String, screenshotUrls: [String],
                ipadScreenshotUrls: [String], trackName: String, artistName: String,
                price: Int, artistUrl: String, videoUrl: String?,
                description: String, primaryGenreName: String,
                releaseDate: String, averageUserRating: Double, userRatingCount: Int,
                fileSizeBytes: String, languageCodesISO2A: [String], minimumOsVersion: String,
                releaseNotes: String, contentAdvisoryRating: String) {
        self.imageUrl = imageUrl
        self.smallImageUrl = smallImageUrl
        self.screenshotUrls = screenshotUrls
        self.ipadScreenshotUrls = ipadScreenshotUrls
        self.trackName = trackName
        self.artistName = artistName
        self.price = price
        self.artistUrl = artistUrl
        self.description = description
        self.primaryGenreName = primaryGenreName
        self.releaseDate = releaseDate
        self.averageUserRating = averageUserRating
        self.userRatingCount = userRatingCount
        self.fileSizeBytes = fileSizeBytes
        self.languageCodesISO2A = languageCodesISO2A
        self.minimumOsVersion = minimumOsVersion
        self.releaseNotes = releaseNotes
        self.contentAdvisoryRating = contentAdvisoryRating
    }
}

struct SoftwareView_Previews: PreviewProvider {
    static var previews: some View {
        SoftwareView(viewModel: SearchViewModel(),
                     itunes: .all,
                     screenWidth: 0.0)
    }
}
