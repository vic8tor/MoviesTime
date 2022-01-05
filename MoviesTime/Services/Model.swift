//
//  Model.swift
//  MoviesTime
//
//  Created by Victor on 05.01.2022.
//

import Foundation

struct Movie {
    let name: String
    let genre: String
    let year: String
    var raiting: Float {
        Float.random(in: 1...10)
    }
    var image: String {
        "\(name) - \(year)"
    }
    static func getMovie() -> [Movie] {
        var movies: [Movie] = []
        
        let name = DataManager.shared.names
        let genre = DataManager.shared.genre
        let year = DataManager.shared.years
        
        let iteration = min(
            name.count,
            genre.count,
            year.count
        )
    
        for index in 1..<iteration {
            movies.append(Movie(name: name[index], genre: genre[index], year: year[index]))
        }
    return movies
    }
}
