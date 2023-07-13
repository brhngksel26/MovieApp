//
//  NetworkManager.swift
//  MovieApp
//
//  Created by Burhan Göksel on 8.05.2023.
//

import Foundation


class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    @discardableResult
    func download(url: URL, completion: @escaping (Result<Data, Error>) -> ()) {
        URLSession.shared.dataTask(with: url){ data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(error))
                return
            }
            
            guard
                let reponse = response as? HTTPURLResponse,
                reponse.statusCode == 200 else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            
            guard let data = data else {
                completion(.failure(URLError(.badURL)))
                return
            }
            completion(.success(data))
        }
        .resume()
    }
}
