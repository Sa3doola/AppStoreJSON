//
//  Reviews.swift
//  AppStoreJSON
//
//  Created by Saad Sherif on 11/22/20.
//

import Foundation

struct Reviews: Codable {
    let feed: ReviewFeed
}

struct ReviewFeed: Codable {
    let entry: [Entry]
}

struct Entry: Codable {
    let author: Author
    let title: Label
    let content: Label
    
    let rating: Label
    private enum CodingKeys: String, CodingKey {
        case author, title, content
        case rating = "im:rating"
    }
}

struct Author: Codable {
    let name: Label
}

struct Label: Codable {
    let label: String
}
