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
        //let topRatedUrl = "https://api.themoviedb.org/3/movie/top_rated?api_key=97fd25ac93042d4d2d469b66b1505de7"
        guard let url = URL(string: url ) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error descpription")
                return
            }
            do {
                let movies = try JSONDecoder().decode(MoviesData.self, from: data)
                print(movies)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    


}

