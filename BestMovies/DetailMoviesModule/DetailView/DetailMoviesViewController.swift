//
//  DetailMoviesViewController.swift
//  BestMovies
//
//  Created by Denis on 29.02.2020.
//  Copyright © 2020 Denis. All rights reserved.
//

import UIKit

class DetailMoviesViewController: UIViewController {
    
    var presenter: DetailMoviesViewPresenterProtocol!

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setMove()
    }
}

extension DetailMoviesViewController: DetailMoviesViewProtocol {
    func setMovie(movie: Movie?) {
        textView.text = movie?.Plot
    }
    
    
}
