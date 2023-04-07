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
    let itunes: ITunes
    let imageUrl: String
    let smallImageUrl: String
    let screenshotUrls: [String]
    let ipadScreenshotUrls: [String]
    let trackName: String
    let artistName: String
    let price: Int?
    let artistUrl: String?
    let videoUrl: String?
    let longDescription: String?
    let primaryGenreName: String
    let releaseDate: String
    let trackTimeMillis: Int?
    let averageUserRating: Double
    let userRatingCount: Int
    let fileSizeBytes: String
    let languageCodesISO2A: [String]
    let minimumOsVersion: String
    let releaseNotes: String
    let contentAdvisoryRating: String
    
    var body: some View {
        
        VStack {
            switch itunes {
            case .all:
                Text("home")
            case .movie:
                NavigationStack {
                    MovieDetailView(image: imageUrl,
                                    title: trackName,
                                    artist: artistName,
                                    price: price,
                                    videoUrl: videoUrl,
                                    longDescription: longDescription,
                                    primaryGenreName: primaryGenreName,
                                    releaseDate: dateFomatter(String(releaseDate.prefix(10))),
                                    trackTimeMillis: msToS(trackTimeMillis))
                }
               
            case .tvShow:
                Text("tvshow")
            case .podcast:
                Text("podcast")
            case .music:
                Text("music")
            case .musicVideo:
                Text("muiscvideo")
            case .software:
                NavigationStack {
                    SoftwareDetailView(imageUrl: imageUrl, screenshotUrls: screenshotUrls, ipadScreenshotUrls: ipadScreenshotUrls, smallImageUrl: smallImageUrl, trackName: trackName, artistName: artistName, artistUrl: artistUrl!,
                                       averageUserRating: averageUserRating, userRatingCount: userRatingCount,
                                       fileSizeBytes: byteFormatter(value: fileSizeBytes), languageCodesISO2A: languageCodesISO2A,
                                       minimumOsVersion: minimumOsVersion, description: longDescription ?? "",
                                       releaseNotes: releaseNotes, contentAdvisoryRating: contentAdvisoryRating,
                                       primaryGenreName: primaryGenreName)
                }
                
            case .ebook:
                Text("ebook")
            case .audiobook:
                Text("audiobook")
                
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
    
    
    func msToS(_ value: Int?) -> String {
        if let value {
            let time: TimeInterval = TimeInterval(value / 1000)
            let dateFormatter = DateComponentsFormatter()
            dateFormatter.unitsStyle = .full
            dateFormatter.allowedUnits = [.hour, .minute]
            
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
