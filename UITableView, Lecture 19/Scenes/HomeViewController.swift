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
        MoviesDetails(title: "Batman", image: UIImage(named: "Batman")!, genre: .Action, rating: 8.1),
        MoviesDetails(title: "Uncharted", image: UIImage(named: "Uncharted")!, genre: .Adventure, rating: 7.9),
        MoviesDetails(title: "The Exorcism of God", image: UIImage(named: "Exorcism")!, genre: .Horror, rating: 5.6),
        MoviesDetails(title: "Turning Red", image: UIImage(named: "Turning")!, genre: .Comedy, rating: 7.1),
        MoviesDetails(title: "Spider-Man: No Way Home", image: UIImage(named: "Spiderman")!, genre: .Action, rating: 8.1),
        MoviesDetails(title: "Morbius", image: UIImage(named: "Morbius")!, genre: .Action, rating: 5.3)
    ]
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private let moviesSectionTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Now in cinemas"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    // MARK: - ViewLifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mainStackView)

        setUpNavigationBar()
        view.addSubview(moviesSectionTitleLabel)
        setupBackground()
        setupCollectionView()
        setupMainStackViewConstraints()
    }
    
    // MARK: - Private Methods
    
    private func setupBackground() {
        view.backgroundColor = UIColor(red: 26/255, green: 34/255, blue: 50/255, alpha: 1.0)
        navigationController?.navigationBar.barTintColor = UIColor(red: 31/255, green: 41/255, blue: 61/255, alpha: 0.7)
    }
    
    private func setUpNavigationBar() {
        let logo = UIImage(named: "Logo")
        let logoButton = UIButton(type: .custom)
        logoButton.setImage(logo, for: .normal)
        
        logoButton.addTarget(self, action: #selector(logoButtonDidTap), for: .touchUpInside)
        let logoBarButtonItem = UIBarButtonItem(customView: logoButton)
        navigationItem.leftBarButtonItem = logoBarButtonItem
        
        let profileButton = UIButton(type: .custom)
        profileButton.setTitle("Profile", for: .normal)
        profileButton.setTitleColor(.white, for: .normal)
        profileButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        profileButton.backgroundColor = .orange
        profileButton.layer.cornerRadius = 8
        profileButton.clipsToBounds = true
        //        profileButton.titleEdgeInsets = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16) ფედინგების გაკეთება მინდოდა, მაგრამ ვერ ვიპოვე, როგორ გავაკეთო. ეს ვნახე, მაგრამ ვორნინგს მიგდებს:
        profileButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        
        profileButton.addTarget(self, action: #selector(profileButtonDidTap), for: .touchUpInside)
        let profileBarButtonItem = UIBarButtonItem(customView: profileButton)
        navigationItem.rightBarButtonItem = profileBarButtonItem
    }
    
    @objc func logoButtonDidTap() {}
    @objc func profileButtonDidTap() {}
    
    private func setupCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = .none
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MoviesCell.self, forCellWithReuseIdentifier: "MoviesCell")
        mainStackView.addArrangedSubview(collectionView)
        
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
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 56),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -12),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            moviesSectionTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            moviesSectionTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
    }
}

// MARK: - CollectionView DataSource, Delegate

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        allMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviesCell", for: indexPath) as! MoviesCell
        let movie = allMovies[indexPath.item]
        
        cell.setUpRatingButton(movie.rating)
        cell.movieImageView.image = movie.image
        cell.titleLabel.text = movie.title
        cell.genreLabel.text = "\(movie.genre)"
        cell.backgroundColor = UIColor(red: 26/255, green: 34/255, blue: 50/255, alpha: 1.0)
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.size.width - 32 - 16) / 2 , height: 230)
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedMovie = allMovies[indexPath.item]
        let movieDetailVC = MovieDetailViewController()
        movieDetailVC.movieDetails = selectedMovie
        navigationController?.pushViewController(movieDetailVC, animated: true)
    }
}
