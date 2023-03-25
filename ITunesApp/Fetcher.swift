//
//  Fetcher.swift
//  ITunesApp
//
//  Created by 井上智輝 on 2023-03-22.
//

import Foundation

enum FetcherError: Error {
    case networkError
    case statusError
}

class Fetcher {
    static func fetch(_ url: URL) async -> Result<Data, Error> {
        let request = URLRequest(url: url)
        let session = URLSession(configuration: .default)
        
        do {
            let (data, response) = try await session.data(for: request)
            
            guard let response = response as? HTTPURLResponse else {
                return .failure(FetcherError.networkError)
            }
            
            if !(200 ... 299).contains(response.statusCode) {
                return .failure(FetcherError.statusError)
            }
            
            return .success(data)
            
        } catch {
            return .failure(error)
        }
    }
}
