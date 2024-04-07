//
//  MovieScreenViewController.swift
//  FilmHub
//
//  Created by err on 24.03.2024.
//

import UIKit

class MovieScreenViewController: UIViewController {

    var viewModel: MovieScreenViewModel?
    var movieScreenView: MovieScreenView?
    var rateTheFilmViewController: RateTheFilmViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupUI()
        viewModel?.fetchMovieDetails()
    }

    func setupUI() {
        movieScreenView = MovieScreenView()
        guard let movieScreenView = movieScreenView else { return }
        view.addSubview(movieScreenView)
        movieScreenView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieScreenView.topAnchor.constraint(equalTo: view.topAnchor),
            movieScreenView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            movieScreenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            movieScreenView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        movieScreenView.rateButtonAction = { [weak self] in
                self?.rateTheFilmButtonTapped()
            }

        movieScreenView.movieAboutButtonAction = { [weak self] in
                self?.movieAboutButtonTapped()
            }

    }



    @objc internal func rateTheFilmButtonTapped() {
        let rateTheFilmViewController = RateTheFilmViewController()
        navigationController?.pushViewController(rateTheFilmViewController, animated: true)
    }


    @objc internal func movieAboutButtonTapped() {
        let movieDetailsViewController = MovieDetailsViewController()
        navigationController?.pushViewController(movieDetailsViewController, animated: true)
    }

    
}
