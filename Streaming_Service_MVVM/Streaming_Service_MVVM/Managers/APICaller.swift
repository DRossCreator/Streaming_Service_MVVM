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

    func getTrendingMovies(complition: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.basicURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else { return }

        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                complition(.success(results.results))
            } catch {
                complition(.failure(APIError.failedTogetData))
            }

        }
        task.resume()
    }

    func getTrendingTVs(complition: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.basicURL)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else { return }

        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                print(results)
            } catch {
                complition(.failure(APIError.failedTogetData))
            }

        }
        task.resume()
    }

    func getUpcomingMovies(complition: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.basicURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)&language=en-US&page=1") else { return }

        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                print(results)
            } catch {
                complition(.failure(APIError.failedTogetData))
            }

        }
        task.resume()
    }

    func getPopular(complition: @escaping (Result<[TrendingTitleResponse], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.basicURL)/3/movie/popular?api_key=\(Constants.API_KEY)&language=en-US&page=1") else { return }

        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                print(results)
            } catch {
                complition(.failure(APIError.failedTogetData))
            }

        }
        task.resume()
    }


}
