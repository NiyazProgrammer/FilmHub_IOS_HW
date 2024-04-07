//
//  MovieDetailsViewController.swift
//  FilmHub
//
//  Created by err on 24.03.2024.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    var movieDetailsView: MovieDetailsView?
    var movieDetailsViewModel: MovieScreenViewModel?

    override func viewDidLoad() {
            super.viewDidLoad()
            navigationItem.title = "О фильме"
            navigationController?.navigationBar.tintColor = .white
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            let backButtonImage = UIImage(systemName: "arrow.backward")
            let backButton = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(backButtonTapped))
            navigationItem.leftBarButtonItem = backButton

            setUpUI()
    }

    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }

    func setUpUI() {

        movieDetailsView = MovieDetailsView()
        guard let movieScreenView = movieDetailsView else { return }
        view.addSubview(movieScreenView)
        movieScreenView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieScreenView.topAnchor.constraint(equalTo: view.topAnchor),
            movieScreenView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            movieScreenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            movieScreenView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        
    }

}
