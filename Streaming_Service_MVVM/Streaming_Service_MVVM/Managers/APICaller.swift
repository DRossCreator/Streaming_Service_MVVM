//
//  APICaller.swift
//  Streaming_Service_MVVM
//
//  Created by Daniil Yarkovenko on 14.08.2022.
//

import Foundation

struct Constants {
    static let API_KEY = "68f453c267033a6ed162d3d9dc30d0f1"
    static let basicURL = "https://api.themoviedb.org"
}

enum APIError: Error {
    case failedTogetData
}

class APICaller {

    //MARK: - Singletone

    static let shared = APICaller()

    func getTrendingMovies(complition: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.basicURL)/3/trending/all/day?api_key=\(Constants.API_KEY)") else { return }

        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                complition(.success(results.results))
            } catch {
                complition(.failure(error))
            }

        }
        task.resume()
    }
}
