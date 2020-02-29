//
//  ModuleBuilder.swift
//  BestMovies
//
//  Created by Denis on 29.02.2020.
//  Copyright © 2020 Denis. All rights reserved.
//

import UIKit

protocol Builder {
    static func createMoviesModule() -> UIViewController
    static func createDetailMoviesModule(movie: Movie?) -> UIViewController
}

class ModuleBuilder: Builder {
    
    static func createMoviesModule() -> UIViewController {
        let view = MoviesViewController()
        let networkService = NetworkService()
        let presenter = MoviesPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
    
    static func createDetailMoviesModule(movie: Movie?) -> UIViewController {
        let view = DetailMoviesViewController()
        let networkService = NetworkService()
        let presenter = DetailMoviePresenter(view: view,
                                             networkService: networkService,
                                             movie: movie)
        view.presenter = presenter
        return view
    }
}
