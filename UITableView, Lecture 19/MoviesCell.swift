//
//  MoviesCell.swift
//  UITableView, Lecture 19
//
//  Created by Ani's Mac on 03.11.23.


import UIKit

class MoviesCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    let movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0    //ორ ხაზიანი როცაა ტექსტი, ვიუს ჰეითი უცვლელია და ვერ ვასწორებ :/ (სპაიდერმენზე ჩანს ცუდად)
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let genreLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 99/255, green: 115/255, blue: 148/255, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let heartButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let outlineHeartIcon = UIImage(systemName: "heart")?.withTintColor(.red, renderingMode: .alwaysOriginal)
        let fillHeartIcon = UIImage(systemName: "heart.fill")?.withTintColor(.red, renderingMode: .alwaysOriginal)
        
        button.setImage(outlineHeartIcon, for: .normal)
        button.setImage(fillHeartIcon, for: .selected)
        
        return button
    }()
    
    private let ratingButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        button.layer.cornerRadius = 4
        button.clipsToBounds = true
        return button
    }()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
        setupConstraints()
        setUpButtonActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Private Methods
    
    private func setupSubviews() {
        contentView.addSubview(movieImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(genreLabel)
        contentView.addSubview(heartButton)
        contentView.addSubview(ratingButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            movieImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            movieImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            movieImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            movieImageView.heightAnchor.constraint(equalToConstant: 180),
            
            titleLabel.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            genreLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            genreLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            genreLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            genreLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            heartButton.widthAnchor.constraint(equalToConstant: 20),
            heartButton.heightAnchor.constraint(equalToConstant: 20),
            heartButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            heartButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            
            ratingButton.widthAnchor.constraint(equalToConstant: 32),
            ratingButton.heightAnchor.constraint(equalToConstant: 24),
            ratingButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            ratingButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
    }
    
    func setUpButtonActions() {
        heartButton.addAction(UIAction(handler: { [weak self] action in
            self?.heartButtonDidTap()
        }), for:.touchUpInside)
    }
    
    func heartButtonDidTap() {
        heartButton.isSelected.toggle()
    }
    
    func setUpRatingButton(_ rating: Double) {
        ratingButton.setTitle("\(rating)", for: .normal)
        ratingButton.backgroundColor = (rating >= 6.0) ? .orange : .darkGray
    }
}
