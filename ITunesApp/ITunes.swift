//
//  ITunesResutl.swift
//  ITunesApp
//
//  Created by 井上智輝 on 2023-03-23.
//

import Foundation

struct ITunesRequest {
    let term: String
    let media: String
    let country: String
    let lang: String
    
    init(term: String, media: String, country: String = "jp", lang: String = "ja_jp") {
        self.term = term
        self.media = media
        self.country = country
        self.lang = lang
    }
}


struct ITunesMovieResult: Decodable {
    let resultCount: Int
    let results: [Result]
    
    struct Result: Decodable, Hashable {
        let wrapperType: String
        let kind: String
        let artistName: String
        let trackName: String
        let trackCensoredName: String
        let trackViewUrl: String
        let previewUrl: String?
        let artworkUrl30, artworkUrl60, artworkUrl100: String
        let collectionPrice, trackPrice: Int?
        let trackRentalPrice: Int?
        let collectionHdPrice: Int?
        let trackHdPrice: Int?
        let trackHdRentalPrice: Int?
        let releaseDate: String
        let collectionExplicitness, trackExplicitness: String
        let trackTimeMillis: Int?
        let country, currency, primaryGenreName, longDescription: String
    }
}


struct ITunesPodcastResult: Decodable {
    let resultCount: Int
    let results: [Result]
    
    struct Result: Decodable, Hashable {
        let collectionName, trackName, collectionCensoredName, trackCensoredName: String
        let artistViewURL: String?
        let collectionViewURL: String?
        let feedURL: String?
        let trackViewURL: String?
        let artworkUrl30, artworkUrl60, artworkUrl100: String
        let collectionPrice, trackPrice, collectionHdPrice: Int?
        let releaseDate: String
        let trackCount: Int
        let trackTimeMillis: Int?
        let primaryGenreName: String
        let artworkUrl600: String
        let genres: [String]
    }
}


struct ITunesMusicResult: Decodable {
    let resultCount: Int
    let results: [Result]
    
    struct Result: Decodable, Hashable {
        let artistName, collectionName, trackName, collectionCensoredName: String
        let trackCensoredName: String
        let artistViewURL, collectionViewURL, trackViewURL: String?
        let previewURL: String?
        let artworkUrl30, artworkUrl60, artworkUrl100: String
        let collectionPrice, trackPrice: Int
        let releaseDate: String
        let discCount, discNumber, trackCount, trackNumber: Int
        let trackTimeMillis: Int
        let isStreamable: Bool
        let collectionArtistName: String?
    }
}


struct ITunesMusicVideoResult: Decodable {
    let resultCount: Int
    let results: [Result]
    
    struct Result: Decodable, Hashable {
        let artistName, trackName, trackCensoredName: String
        let artistViewURL, trackViewURL: String?
        let previewURL: String?
        let artworkUrl30, artworkUrl60, artworkUrl100: String
        let collectionPrice, trackPrice: Int?
        let releaseDate: String
        let trackTimeMillis: Int?
        let primaryGenreName: String
        let collectionName, collectionCensoredName: String?
        let collectionViewURL: String?
        let discCount, discNumber, trackCount, trackNumber: Int?
    }
}


struct ITunesAudiobookResult: Decodable {
    let resultCount: Int
    let results: [Result]
    
    struct Result: Decodable, Hashable {
        let artistName, collectionName, collectionCensoredName: String
        let artistViewURL, collectionViewURL: String?
        let artworkUrl60, artworkUrl100: String
        let collectionPrice: Int
        let trackCount: Int
        let copyright: String?
        let releaseDate: String
        let primaryGenreName: String
        let previewURL: String?
        let description: String
    }
}


struct ITunesTVShowResult: Decodable {
    let resultCount: Int
    let results: [Result]
    
    struct Result: Decodable, Hashable {
        let artistName, collectionName, trackName, collectionCensoredName: String
        let trackCensoredName: String
        let artistViewURL, collectionViewURL, trackViewURL: String?
        let artworkUrl30, artworkUrl60, artworkUrl100: String
        let releaseDate: String
        let discCount, discNumber, trackCount, trackNumber: Int
        let shortDescription, longDescription: String
    }
}


struct ITunesSoftwareResult: Decodable {
    let resultCount: Int
    let results: [Result]

    struct Result: Decodable, Hashable {
        let isGameCenterEnabled: Bool
        let screenshotUrls, ipadScreenshotUrls: [String]
        let artworkUrl60, artworkUrl512, artworkUrl100: String
        let artistViewURL: String?
        let supportedDevices: [String]
        let advisories: [String]
        let genres: [String]
        let price: Int?
        let artistName, primaryGenreName: String
        let primaryGenreID: Int?
        let description: String
        let releaseDate: String
        let sellerName: String
        let isVppDeviceBasedLicensingEnabled: Bool
        let minimumOSVersion, trackCensoredName: String?
        let languageCodesISO2A: [String]
        let fileSizeBytes: String
        let averageUserRatingForCurrentVersion: Double
        let userRatingCountForCurrentVersion: Int
        let averageUserRating: Double
        let trackViewURL: String?
        let bundleID: String?
        let currentVersionReleaseDate: String
        let releaseNotes: String?
        let trackName, version: String
        let userRatingCount: Int
        let sellerURL: String?
    }
}


struct ITunesEbookResult: Decodable {
    let resultCount: Int
    let results: [Result]
    
    struct Result: Decodable, Hashable {
        let artistName: String
        let genres: [String]
        let price: Int
        let description: String
        let releaseDate: String
        let trackName: String
        let artworkUrl60: String
        let artworkUrl100: String
        let artistViewUrl: String
        let trackCensoredName: String
        let fileSizeBytes: Int
        let trackViewUrl: String
        let userRatingCount: Int?
        let averageUserRating: Double?
    }
}
