//
//  HomeViewController.swift
//  UITableView, Lecture 19
//
//  Created by Ani's Mac on 03.11.23.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    private var collectionView: UICollectionView!
    
    private let allMovies = [
        MoviesDetails(title: "Batman", image: UIImage(named: "Batman")!, genre: .Action),
        MoviesDetails(title: "Uncharted", image: UIImage(named: "Uncharted")!, genre: .Adventure),
        MoviesDetails(title: "The Exorcism of God", image: UIImage(named: "Exorcism")!, genre: .Horror),
        MoviesDetails(title: "Turning Red", image: UIImage(named: "Turning")!, genre: .Comedy),
        MoviesDetails(title: "Spider-Man: No Way Home", image: UIImage(named: "Spiderman")!, genre: .Action),
        MoviesDetails(title: "Morbius", image: UIImage(named: "Morbius")!, genre: .Action)
    ]
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .gray
        return stackView
    }()
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mainStackView)
        
        setupBackground()
        setupCollectionView()
        setupMainStackViewConstraints()
    }
    
    
    // MARK: - Private Methods
    private func setupBackground() {
        view.backgroundColor = .white
    }
    
    
    private func setupCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MoviesCell.self, forCellWithReuseIdentifier: "MoviesCell")
        mainStackView.addArrangedSubview(collectionView)
        
        collectionView.frame = view.bounds
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: mainStackView.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor)
        ])
    }
    
    private func setupMainStackViewConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -12),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
}

// MARK: - CollectionView DataSource, Delegate

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        allMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviesCell", for: indexPath)
        let movie = allMovies[indexPath.item]
        
        if let moviesCell = cell as? MoviesCell {
            moviesCell.movieImageView.image = movie.image
            moviesCell.titleLabel.text = movie.title
            moviesCell.genreLabel.text = "\(movie.genre)"
        }
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.size.width - 32 - 16) / 2 , height: 230)
    }
}



