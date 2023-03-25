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

