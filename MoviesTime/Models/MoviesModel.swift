//
//  Model.swift
//  MoviesTime
//
//  Created by Victor on 05.01.2022.
//

import Foundation

struct MoviesData: Decodable {
    let movies: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
    
}
struct Movie: Decodable {
    let title: String?
//    let genre: String?
    let year: String?
    let image: String?
    let wideImage: String?
    let overview: String?
    var rate: Double?
    
    private enum CodingKeys: String, CodingKey {
        case title, overview
        case year = "release_date"
        case rate = "vote_average"
        case image = "poster_path"
        case wideImage = "backdrop_path"
    }
}

enum Url: String {
    case moviesTB = "https://api.themoviedb.org/3/movie/top_rated?api_key=97fd25ac93042d4d2d469b66b1505de7"
    case imageUrl = "https://image.tmdb.org/t/p/w300"
}


