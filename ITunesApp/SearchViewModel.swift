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
    @Published var allResults: [String]?
    @Published var movieResults: [ITunesMovieResult.Result]?
    @Published var ebookResults: [ITunesEbookResult.Result]?
    @Published var resultCount: Int = 0
    private let url: String = "https://itunes.apple.com/search"
    
    
    @MainActor
    func search(term: String, media: String, itunes: ITunes) {
        status = .unfinished
        ebookResults?.removeAll()
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
            print("********")
            switch result {
            case .failure(let error):
                status = .failded
                print(error)
                
            case .success(let data):
                print("______")
                do {
                    // TODO: breakで処理を飛ばしてるとこを書く
                    switch itunes {
                    case .all:
                        break
                    case .movie:
                        let result = try JSONDecoder().decode(ITunesMovieResult.self, from: data)
                        print("++++")
                        resultCount = result.resultCount
                        movieResults = result.results
                        print("----")
                        
                    case .podcast:
                        break
                    case .music:
                        break
                    case .musicVideo:
                        break
                    case .audiobook:
                        break
                    case .shortFilm:
                        break
                    case .tvShow:
                        break
                    case .softWare:
                        break
                    case .ebook:
                        let result = try JSONDecoder().decode(ITunesEbookResult.self, from: data)
                        resultCount = result.resultCount
                        ebookResults = result.results
                    }
                    
                    status = .succese
                    
                } catch {
                    print(error)
                    status = .failded
                }
            }
        }
    }
    
//    @MainActor
//    private func decodeResult(itunes: ITunes, data: Data) {
//        do {
//            switch itunes {
//            case .all:
//                break
//
//            case .movie:
//                let result = try JSONDecoder().decode(ITunesMovieResult.self, from: data)
//                resultCount = result.resultCount
//                movieResults = result.results
//
//            case .podcast:
//                break
//
//            case .music:
//                break
//
//            case .musicVideo:
//                break
//
//            case .audiobook:
//                break
//
//            case .shortFilm:
//                break
//
//            case .tvShow:
//                break
//
//            case .softWare:
//                break
//
//            case .ebook:
//                let result = try JSONDecoder().decode(ITunesEbookResult.self, from: data)
//                resultCount = result.resultCount
//                ebookResults = result.results
//            }
//
//        } catch {
//            print(error)
//            status = .failded
//        }
//    }
}

