//
//  DetailMoviePresenter.swift
//  BestMovies
//
//  Created by Denis on 29.02.2020.
//  Copyright © 2020 Denis. All rights reserved.
//

import Foundation


protocol DetailMoviesViewProtocol: class {
    func setMovie(movie: Movie?)
    
}

protocol DetailMoviesViewPresenterProtocol: class {
    var movie:Movie? { get set }
    init (view: DetailMoviesViewProtocol, networkService: NetworkServiceProtocol,
          movie: Movie?)
    func setMovie()
    func setImage(completion: @escaping (Data) -> Void)
    
}

class DetailMoviePresenter: DetailMoviesViewPresenterProtocol {
    weak var view: DetailMoviesViewProtocol?
    let networkService: NetworkServiceProtocol!
    var movie: Movie?
    
    required init(view: DetailMoviesViewProtocol,
                  networkService: NetworkServiceProtocol,
                  movie: Movie?) {
        self.view = view
        self.networkService = networkService
        self.movie = movie
    }
    
    func setMovie() {
        view?.setMovie(movie: movie)
    }
    

    func setImage(completion: @escaping (Data) -> Void) {
        guard let stringURL = self.movie?.Images?.first else { return }
        guard let imageURL = URL(string: stringURL) else { return }
        guard let imageData = try? Data(contentsOf: imageURL) else { return }
        completion(imageData)
    }
}

