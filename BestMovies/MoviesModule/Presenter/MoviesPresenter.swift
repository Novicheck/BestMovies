//
//  MoviesPresenter.swift
//  BestMovies
//
//  Created by Denis on 29.02.2020.
//  Copyright © 2020 Denis. All rights reserved.
//

import Foundation

protocol MoviesViewProtocol: class {
    func succes()
    func failure(error: Error)
}

protocol MoviesViewPresenterProtocol: class {
    init (view: MoviesViewProtocol, networkService: NetworkServiceProtocol)
    func getMovies()
    var movies:[Movie]? {get set}
}

class MoviesPresenter: MoviesViewPresenterProtocol {
    weak var view: MoviesViewProtocol?
    let networkService: NetworkServiceProtocol!
    var movies: [Movie]?
    
    required init(view: MoviesViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getMovies()
    }
    
    func getMovies() {
        networkService.getMovies { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch result {
                    case .success(let movies):
                        self.movies = movies
                        self.view?.succes()
                    case .failure(let error):
                        print(error.localizedDescription)
                        self.view?.failure(error: error)
                }
            }
        }
    }
}
