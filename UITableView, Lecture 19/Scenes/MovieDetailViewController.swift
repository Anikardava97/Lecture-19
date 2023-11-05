//
//  MovieDetailViewController.swift
//  UITableView, Lecture 19
//
//  Created by Ani's Mac on 03.11.23.
//

import UIKit

final class MovieDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    var movieDetails: MoviesDetails?
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 1
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private let moviePosterStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private let moviePosterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let ratingStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually //წესით აქ ვუშვებ რაღაც შეცდომას, ამ სტეკში რა კონტენტიცაა, მინდა, რომ ცენტრში მოექცეს და დაშორება მათ შორის იყოს 4, ახლა კიდევ სტეკის ზედა და ქვედა კიდეებზეა :((((
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private let imdbLabel: UILabel = {
        let label = UILabel()
        label.text = "IMDB"
        label.textColor = UIColor(red: 99/255, green: 115/255, blue: 148/255, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private let descriptionStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private let movieDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "When the Riddler, a sadistic serial killer, begins murdering key political figures in Gotham, Batman is forced to investigate the city's hidden corruption and question his family's involvement."
        return label
    }()
    
    private let certificateStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private let certificateLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 99/255, green: 115/255, blue: 148/255, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Certificate"
        return label
    }()
    
    private let certificateResultLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "16"
        return label
    }()
    
    private let runtimeStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private let runtimeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 99/255, green: 115/255, blue: 148/255, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Runtime"
        return label
    }()
    
    private let runtimeResultLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "02:56"
        return label
    }()
    
    private let releaseStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private let releaseLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 99/255, green: 115/255, blue: 148/255, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Release"
        return label
    }()
    
    private let releaseResultLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "2022"
        return label
    }()
    
    private let genreStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private let genreLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 99/255, green: 115/255, blue: 148/255, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Genre"
        return label
    }()
    
    private let genreResultLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    private let directorStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private let directorLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 99/255, green: 115/255, blue: 148/255, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Director"
        return label
    }()
    
    private let directorResultLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Matt Reeves"
        return label
    }()
    
    private let castStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .top
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private let castLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 99/255, green: 115/255, blue: 148/255, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Cast"
        return label
    }()
    
    private let castResultLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "Robert Pattinson, Zoë Kravitz, Jeffrey Wright, Colin Farrell, Paul Dano, John Turturro, Andy Serkis, Peter Sarsgaard"
        return label
    }()
    
    private let bottomStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private let selectButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Select Session", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .orange
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        return button
    }()
    
    // MARK: - ViewLifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setUpSubviews()
        setUpNavigationBar()
        setupConstraints()
    }
    
    // MARK: - Private Methods
    
    private func setupBackground() {
        view.backgroundColor = UIColor(red: 26/255, green: 34/255, blue: 50/255, alpha: 1.0)
        navigationController?.navigationBar.barTintColor = UIColor(red: 31/255, green: 41/255, blue: 61/255, alpha: 0.7)
    }
    
    private func setUpSubviews() {
        view.addSubview(mainStackView)
        
        ratingLabel.text = "\(movieDetails?.rating ?? 0.0)" //ეს სად დავწერო არ ვიცი:) ამიტომ იყოს აქ
        
        if let genre = movieDetails?.genre {        // ესეც
            genreResultLabel.text = "\(genre)"
        } else {
            genreResultLabel.text = "Unknown"
        }
        
        mainStackView.addArrangedSubview(moviePosterStack)
        moviePosterImageView.image = movieDetails?.image
        moviePosterStack.addArrangedSubview(moviePosterImageView)
        
        mainStackView.addArrangedSubview(ratingStack)
        ratingStack.addArrangedSubview(ratingLabel)
        ratingStack.addArrangedSubview(imdbLabel)
        
        certificateStack.addArrangedSubview(certificateLabel)
        certificateStack.addArrangedSubview(certificateResultLabel)
        
        runtimeStack.addArrangedSubview(runtimeLabel)
        runtimeStack.addArrangedSubview(runtimeResultLabel)
        
        releaseStack.addArrangedSubview(releaseLabel)
        releaseStack.addArrangedSubview(releaseResultLabel)
        
        genreStack.addArrangedSubview(genreLabel)
        genreStack.addArrangedSubview(genreResultLabel)
        
        directorStack.addArrangedSubview(directorLabel)
        directorStack.addArrangedSubview(directorResultLabel)
        
        castStack.addArrangedSubview(castLabel)
        castStack.addArrangedSubview(castResultLabel)
        
        descriptionStack.addArrangedSubview(movieDescriptionLabel)
        descriptionStack.addArrangedSubview(certificateStack)
        descriptionStack.addArrangedSubview(runtimeStack)
        descriptionStack.addArrangedSubview(releaseStack)
        descriptionStack.addArrangedSubview(genreStack)
        descriptionStack.addArrangedSubview(directorStack)
        descriptionStack.addArrangedSubview(castStack)
        
        mainStackView.addArrangedSubview(descriptionStack)
        
        view.addSubview(bottomStack)
        bottomStack.addArrangedSubview(selectButton)
    }
    
    private func setUpNavigationBar() {
        navigationItem.title = movieDetails?.title
        
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor(.white),
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .bold)
        ]
        navigationController?.navigationBar.titleTextAttributes = attributes
        
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"),
                                         style: .plain,
                                         target: self,
                                         action: #selector(backButtonDidTap))
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func backButtonDidTap() {
        navigationController?.popViewController(animated: true)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            moviePosterStack.topAnchor.constraint(equalTo: mainStackView.safeAreaLayoutGuide.topAnchor),
            moviePosterStack.heightAnchor.constraint(equalToConstant: 210),
            moviePosterStack.widthAnchor.constraint(equalTo: mainStackView.widthAnchor),
            
            ratingStack.heightAnchor.constraint(equalToConstant: 72),
            
            movieDescriptionLabel.topAnchor.constraint(equalTo: descriptionStack.topAnchor, constant: 16),
            descriptionStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            certificateLabel.widthAnchor.constraint(equalToConstant: 72),
            runtimeLabel.widthAnchor.constraint(equalToConstant: 72),
            releaseLabel.widthAnchor.constraint(equalToConstant: 72),
            genreLabel.widthAnchor.constraint(equalToConstant: 72),
            directorLabel.widthAnchor.constraint(equalToConstant: 72),
            castLabel.widthAnchor.constraint(equalToConstant: 72),
            
            bottomStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            bottomStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            selectButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
}

