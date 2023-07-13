//
//  APIURLS.swift
//  MovieApp
//
//  Created by Burhan Göksel on 10.05.2023.
//

import Foundation

enum APIURLs{
    static func movies(page: Int) -> String {
        "https://api.themoviedb.org/3/movie/popular?api_key=454bfc7f5360d0e7dbe350b36f9ab1f8&language=en-US&page=\(page)"
    }
    
    static func imageUrl(posterPath: String) -> String {
        "https://image.tmdb.org/t/p/w500\(posterPath)"
    }
    
    static func detail(id: Int) -> String {
        "https://api.themoviedb.org/3/movie/\(id)?api_key=454bfc7f5360d0e7dbe350b36f9ab1f8&language=en-US"
    }
}

