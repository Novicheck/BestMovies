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
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        collectionView.register(UINib(nibName: "ImageViewCell", bundle: nil),
                                forCellWithReuseIdentifier: "ImageViewCell")
        presenter.setMovie()
    }
}

extension DetailMoviesViewController: DetailMoviesViewProtocol {
    func setMovie(movie: Movie?) {
        textView.text = movie?.fullDescription
    }
}

extension DetailMoviesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        presenter.movie?.Images?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageViewCell",for: indexPath) as? ImageViewCell else {return UICollectionViewCell()}
        cell.contentView.backgroundColor = .blue
        return cell
    }
}

extension DetailMoviesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        CGSize(width: collectionView.bounds.width - 10, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
}
