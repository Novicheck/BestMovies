//
//  MoviesViewController.swift
//  BestMovies
//
//  Created by Denis on 29.02.2020.
//  Copyright © 2020 Denis. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController {
    
    var presenter: MoviesViewPresenterProtocol!

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Best Movies"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
}

extension MoviesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.movies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        let movie = presenter.movies?[indexPath.row]
        cell.textLabel?.text = movie?.Title
        cell.detailTextLabel?.text = movie?.Released
        return cell
    }
}

extension MoviesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = presenter.movies?[indexPath.row]
        let detailVC = ModuleBuilder.createDetailMoviesModule(movie: movie)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension MoviesViewController: MoviesViewProtocol {
    func succes() {
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
    
    
}
