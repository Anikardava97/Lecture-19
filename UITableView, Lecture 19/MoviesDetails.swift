//
//  MoviesDetails.swift
//  UITableView, Lecture 19
//
//  Created by Ani's Mac on 04.11.23.
//

import UIKit

enum MovieGenre {
    case Action
    case Adventure
    case Horror
    case Comedy
}

class MoviesDetails {
    var image = UIImage()
    let title: String
    let genre: MovieGenre
    
    init(title: String, image: UIImage, genre: MovieGenre) {
        self.image = image
        self.title = title
        self.genre = genre
    }
}

                    
