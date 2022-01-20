//
//  NetworkingManager.swift
//  MoviesTime
//
//  Created by Victor on 14.01.2022.
//

import Foundation
enum NetworkError: Error {
    case invalidURL, noData, decodingError
}
class NetworkingManager {
    static var shared = NetworkingManager()
    private init() {}

    func fetchData(from url: String, completion: @escaping (Result<MoviesData, NetworkError>) -> Void) {
        guard let url = URL(string: url ) else {
            completion(.failure(.invalidURL))
            return }
        URLSession.shared.dataTask(with: url) { data, _ , error in
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            do {
                let jsonData = try JSONDecoder().decode(MoviesData.self, from: data)
                
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
                
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
//    func fetchDataWithAlamofire(from url: String, completion: ) {
//        
//    }
    
    
}

