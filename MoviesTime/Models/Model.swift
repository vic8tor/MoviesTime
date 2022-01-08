//
//  Model.swift
//  MoviesTime
//
//  Created by Victor on 05.01.2022.
//

import Foundation

struct Movie {
    let name: String
    let genre: [String]
    let image: String
    let desctiption: String
    var raiting: Float {
        Float.random(in: 7...10)
    }
    var imageSmall: String {
        image + "-small"
    }
    var imageWide: String {
        image + "-wide"
    }
    
    static func getMovie() -> [Movie] {
        var movies: [Movie] = []
        
        let name = DataManager.shared.names
        let genre = DataManager.shared.genre
        let image = DataManager.shared.image
        let description = DataManager.shared.description
        
        let iteration = min(
            name.count,
            genre.count,
            description.count
        )
    
        for index in 1..<iteration {
            movies.append(Movie(name: name[index], genre: genre[index], image: image[index]  , desctiption: description[index]))
        }
    return movies
    }
    
}
