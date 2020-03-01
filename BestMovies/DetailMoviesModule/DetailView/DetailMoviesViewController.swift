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

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setMovie()
        presenter.setImage { [weak self] data in
            guard let self = self else {return}
            self.imageView.image = UIImage(data: data)
        }
    }
}

extension DetailMoviesViewController: DetailMoviesViewProtocol {
    func setMovie(movie: Movie?) {
        textView.text = movie?.fullDescription
    }
}



