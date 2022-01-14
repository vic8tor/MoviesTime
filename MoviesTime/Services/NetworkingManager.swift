//
//  NetworkingManager.swift
//  MoviesTime
//
//  Created by Victor on 14.01.2022.
//

import Foundation

class NetworkingManager {
    static var shared = NetworkingManager()
    private init() {}

    func fetchData(url: String, complition: @escaping(_ movie: MoviesData) -> Void) {
        guard let url = URL(string: url ) else { return }
        URLSession.shared.dataTask(with: url) { data, _ , error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error descpription")
                return
            }
            do {
                let movies = try JSONDecoder().decode(MoviesData.self, from: data)
                
                DispatchQueue.main.async {
                    complition(movies)
                }
                
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

