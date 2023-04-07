//
//  SearchViewModel.swift
//  ITunesApp
//
//  Created by 井上智輝 on 2023-03-22.
//

import Foundation

enum RequestStatus {
    case unfinished
    case succese
    case failded
}

class SearchViewModel: ObservableObject {
    @Published var status: RequestStatus = .unfinished
    @Published var movieResults: [ITunesMovieResult.Result]? = []
    @Published var podcastResults: [ITunesPodcastResult.Result]? = []
    @Published var musicResults: [ITunesMusicResult.Result]? = []
    @Published var musicVideoResults: [ITunesMusicVideoResult.Result]? = []
    @Published var audiobookResult: [ITunesAudiobookResult.Result]? = []
    @Published var tvShowResults: [ITunesTVShowResult.Result]? = []
    @Published var softwareResults: [ITunesSoftwareResult.Result]? = []
    @Published var ebookResults: [ITunesEbookResult.Result]? = []
    @Published var resultCount: Int = 0
    private let url: String = "https://itunes.apple.com/search"
    
    
    @MainActor
    func initialSearch(categoryArray: [ITunes], term: String) {
        for category in categoryArray {
            search(term: term, media: category.rawValue, itunes: category)
        }
    }
    
    @MainActor
    func search(term: String, media: String, itunes: ITunes) {
        status = .unfinished
        resultCount = 0
        
        guard let url = URL(string: url) else {
            status = .failded
            return
        }
        
        guard var component = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            status = .failded
            return
        }
        
        let request = ITunesRequest(term: term, media: media)
        let mirror = Mirror(reflecting: request)
        var queryItem: [URLQueryItem] = []
        
        for child in mirror.children {
            if let label = child.label,
               let value = child.value as? String {
                queryItem.append(URLQueryItem(name: label, value: value))
                
            } else {
                continue
            }
        }
        
        component.queryItems = queryItem
        
        guard let componentURL = component.url else {
            status = .failded
            return
        }
        
        print(componentURL)
        
        Task {
            let result = await Fetcher.fetch(componentURL)
            switch result {
            case .failure(let error):
                status = .failded
                print(error)
                
            case .success(let data):
                do {
                    print("aaa")
                    // TODO: breakで処理を飛ばしてるとこを書く
                    switch itunes {
                    case .all:
                        break
                    case .movie:
                        let result = try JSONDecoder().decode(ITunesMovieResult.self, from: data)
                        resultCount = result.resultCount
                        movieResults = result.results
                        
                    case .tvShow:
                        let result = try JSONDecoder().decode(ITunesTVShowResult.self, from: data)
                        resultCount = result.resultCount
                        tvShowResults = result.results
                        
                    case .podcast:
                        let result = try JSONDecoder().decode(ITunesPodcastResult.self, from: data)
                        resultCount = result.resultCount
                        podcastResults = result.results
                        
                    case .music:
                        let result = try JSONDecoder().decode(ITunesMusicResult.self, from: data)
                        resultCount = result.resultCount
                        musicResults = result.results
                        
                    case .musicVideo:
                        let result = try JSONDecoder().decode(ITunesMusicVideoResult.self, from: data)
                        resultCount = result.resultCount
                        musicVideoResults = result.results
                        
                    case .software:
                        let result = try JSONDecoder().decode(ITunesSoftwareResult.self, from: data)
                        resultCount = result.resultCount
                        softwareResults = result.results
                        
                    case .ebook:
                        let result = try JSONDecoder().decode(ITunesEbookResult.self, from: data)
                        resultCount = result.resultCount
                        ebookResults = result.results
                        
                    case .audiobook:
                        let result = try JSONDecoder().decode(ITunesAudiobookResult.self, from: data)
                        resultCount = result.resultCount
                        audiobookResult = result.results
                    }
                    
                    print("bbb")
                    status = .succese
                    
                } catch {
                    print(error)
                    status = .failded
                }
            }
        }
    }
}

