//
//  Model.swift
//  MoviesTime
//
//  Created by Victor on 05.01.2022.
//

import Foundation

struct MoviesData: Decodable {
//    let page: Int?
    let movies: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
    
}
struct Movie: Decodable {
    let title: String?
    let year: String?
    let image: String?
    let wideImage: String?
    let overview: String?
    var rate: Double?
    
    init(movie: [String: Any]) {
    title = movie["title"] as? String
    year = movie["release_date"] as? String
    image = movie["poster_path"] as? String
    wideImage = movie["backdrop_path"] as? String
    overview = movie["overview"] as? String
    rate = movie["vote_average"] as? Double
    }
    
    static func getMovie(from value: Any) -> [Movie] {
        guard let dataList = value as? [String: Any] else { return [] }
        let moviesList = dataList.compactMap{ $0.value as? [[String: Any]]}.flatMap{$0}
        return moviesList.compactMap{ Movie(movie: $0)}
    }
    
    private enum CodingKeys: String, CodingKey {
        case title, overview
        case year = "release_date"
        case rate = "vote_average"
        case image = "poster_path"
        case wideImage = "backdrop_path"
    }
    
}

enum Link: String {
    case moviesTB = "https://api.themoviedb.org/3/movie/top_rated?api_key=97fd25ac93042d4d2d469b66b1505de7&page="
    case imageUrl = "https://image.tmdb.org/t/p/w300"
}


