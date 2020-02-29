//
//  NetworkService.swift
//  BestMovies
//
//  Created by Denis on 29.02.2020.
//  Copyright © 2020 Denis. All rights reserved.
//

import Foundation

protocol NetworkServiceProtocol {
    func getMovies(completion: @escaping (Result<[Movie]?, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    func getMovies(completion: @escaping (Result<[Movie]?, Error>) -> Void) {
        let urlString = "https://gist.githubusercontent.com/saniyusuf/406b843afdfb9c6a86e25753fe2761f4/raw/523c324c7fcc36efab8224f9ebb7556c09b69a14/Film.JSON"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            do {
                let decoder = JSONDecoder()
                let obj = try decoder.decode([Movie].self, from: data!)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
