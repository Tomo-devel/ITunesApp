//
//  DetailView.swift
//  ITunesApp
//
//  Created by 井上智輝 on 2023-04-03.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel: SearchViewModel
    @Binding var isShowDetailView: Bool
    @Binding var imageUrl: String
    @Binding var smallImageUrl: String
    @Binding var screenshotUrls: [String]?
    @Binding var ipadScreenshotUrls: [String]?
    @Binding var trackName: String
    @Binding var artistName: String
    @Binding var collectionName: String?
    @Binding var trackPrice: String?
    @Binding var collectionPrice: String?
    @Binding var artistUrl: String?
    @Binding var trackUrl: String?
    @Binding var videoUrl: String?
    @Binding var collectionUrl: String?
    @Binding var longDescription: String?
    @Binding var primaryGenreName: String?
    @Binding var releaseDate: String
    @Binding var trackTimeMillis: Int?
    @Binding var averageUserRating: Double?
    @Binding var userRatingCount: Int?
    @Binding var fileSizeBytes: String?
    @Binding var languageCodesISO2A: [String]?
    @Binding var minimumOsVersion: String?
    @Binding var releaseNotes: String?
    @Binding var contentAdvisoryRating: String?
    @Binding var genres: [String]?
    let itunes: ITunes
    let screenWidth: Double
    let screenHeight: Double
    
    var body: some View {
        
        NavigationStack {
            VStack {
                switch itunes {
                case .movie:
                    MovieDetailView(image: imageUrl,
                                    title: trackName,
                                    artist: artistName,
                                    trackPrice: String(trackPrice ?? ""),
                                    videoUrl: videoUrl,
                                    longDescription: longDescription,
                                    primaryGenreName: primaryGenreName ?? "",
                                    releaseDate: String(releaseDate.prefix(10)),
                                    trackTimeMillis: msToS(trackTimeMillis))
                    
                case .tvShow:
                    TVDetailView(imageUrl: imageUrl,
                                 artistName: artistName,
                                 trackName: trackName,
                                 collectionName: collectionName ?? "",
                                 artistUrl: artistUrl,
                                 trackUrl: trackUrl,
                                 collectionUrl: collectionUrl,
                                 releaseDate: String(releaseDate.prefix(10)),
                                 primaryGenreName: primaryGenreName ?? "",
                                 constetAdvisoryRating: contentAdvisoryRating ?? "",
                                 longDescription: longDescription ?? "")
                    
                case .podcast:
                    PodcastDetailView(imageUrl: imageUrl,
                                      artistName: artistName,
                                      trackName: trackName,
                                      collectionName: collectionName ?? "",
                                      trackUrl: trackUrl,
                                      collectionUrl: collectionUrl,
                                      trackPrice: trackPrice ?? "",
                                      collectionPrice: collectionPrice ?? "",
                                      releaseDate: String(releaseDate.prefix(10)),
                                      trackTimeMillis: msToS(trackTimeMillis),
                                      genres: genres ?? [])
                    
                case .music:
                    MusicDetailView(imageUrl: imageUrl,
                                    trackName: trackName,
                                    artistName: artistName,
                                    collectionName: collectionName,
                                    artistUrl: artistUrl,
                                    collectionUrl: collectionUrl,
                                    videoUrl: videoUrl,
                                    trackPrice: trackPrice ?? "",
                                    collectionPrice: collectionPrice ?? "",
                                    releaseDate: String(releaseDate.prefix(10)),
                                    trackTimeMilis: msToS(trackTimeMillis),
                                    primaryGenreName: primaryGenreName ?? "")
                    
                case .musicVideo:
                    MusicVideoDetailView(imageUrl: imageUrl,
                                         artistName: artistName,
                                         trackName: trackName,
                                         colletionName: collectionName ?? "",
                                         artistUrl: artistUrl,
                                         trackUrl: trackUrl,
                                         collectionUrl: collectionUrl,
                                         videoUrl: videoUrl,
                                         trackPrice: trackPrice,
                                         collectionPrice: collectionPrice,
                                         releaseDate: String(releaseDate.prefix(10)),
                                         trackTimeMillis: msToS(trackTimeMillis),
                                         primaryGenreName: primaryGenreName ?? "")
                    
                case .software:
                    SoftwareDetailView(imageUrl: imageUrl,
                                       screenshotUrls: screenshotUrls ?? [],
                                       ipadScreenshotUrls: ipadScreenshotUrls ?? [],
                                       smallImageUrl: smallImageUrl,
                                       trackName: trackName,
                                       artistName: artistName,
                                       artistUrl: artistUrl!,
                                       averageUserRating: averageUserRating ?? 0.0,
                                       userRatingCount: userRatingCount ?? 0,
                                       fileSizeBytes: byteFormatter(value: fileSizeBytes ?? ""),
                                       languageCodesISO2A: languageCodesISO2A ?? [],
                                       minimumOsVersion: minimumOsVersion ?? "",
                                       description: longDescription ?? "",
                                       releaseNotes: releaseNotes ?? "",
                                       contentAdvisoryRating: contentAdvisoryRating ?? "",
                                       primaryGenreName: primaryGenreName ?? "",
                                       screenWidth: screenWidth,
                                       screenHeight: screenHeight)
                    
                case .ebook:
                    EbookDetailView(imageUrl: imageUrl,
                                    artistName: artistName,
                                    trackName: trackName,
                                    artistUrl: artistUrl ?? "",
                                    trackUrl: trackUrl ?? "",
                                    price: trackPrice ?? "0",
                                    description: longDescription ?? "",
                                    releaseDate: String(releaseDate.prefix(10)),
                                    genres: genres ?? [],
                                    userRatingCount: userRatingCount ?? 0,
                                    averageUserRating: averageUserRating ?? 0.0,
                                    screenWidth: screenWidth,
                                    screenHeight: screenHeight)
                    
                case .audiobook:
                    AudiobookDetailView(imageUrl: imageUrl,
                                        collectionName: collectionName ?? "",
                                        artistName: artistName,
                                        collectionUrl: collectionUrl,
                                        artistUrl: artistUrl,
                                        videoUrl: videoUrl,
                                        collectionPrice: collectionPrice ?? "",
                                        releaseDate: String(releaseDate.prefix(10)),
                                        primaryGenreName: primaryGenreName ?? "",
                                        description: longDescription ?? "")
                    
                }
            }
            .toolbar {
                Button {
                    isShowDetailView.toggle()
                    
                } label: {
                    Text("完了")
                }
            }
            .task {
                print("*****\(imageUrl)")
            }
        }
    }
    
    
    func msToS(_ value: Int?) -> String {
        if let value {
            let time: TimeInterval = TimeInterval(value / 1000)
            let dateFormatter = DateComponentsFormatter()
            dateFormatter.unitsStyle = .full
            dateFormatter.allowedUnits = [.hour, .minute, .second]
            
            return dateFormatter.string(from: time)!
            
        } else {
            return ""
        }
    }
    
    func dateFomatter(_ value: String) -> String {
        print("value: \(value)")
        print("value: \(type(of: value))")
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = "yyyy-MM-dd"
        let date = formatter.date(from: value)
        
        return formatter.string(from: date ?? Date())
    }
    
    func byteFormatter(value: String) -> String {
        let value = Double(value) ?? 0.0
        let byteCountFormatter = ByteCountFormatter()
        byteCountFormatter.allowedUnits = [.useKB, .useMB, .useGB]
        byteCountFormatter.isAdaptive = true
        byteCountFormatter.zeroPadsFractionDigits = true
        
        let byte = Measurement<UnitInformationStorage>(value: value, unit: .bytes)
        
        byteCountFormatter.countStyle = .binary
        return byteCountFormatter.string(from: byte)
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(viewModel: SearchViewModel(),
//                   isShowDetailView: .constant(false))
//    }
//}
