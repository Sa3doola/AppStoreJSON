//
//  SearchResult.swift
//  AppStoreJSON
//
//  Created by Saad Sherif on 11/15/20.
//

import Foundation

struct SearchResult: Decodable {
    
    let resultCount: Int
    let results: [Result]
}

struct Result: Decodable {
    
    let trackName: String
    let primaryGenreName: String
    var averageUserRating: Float?
    let screenshotUrls: [String]
    let artworkUrl100: String // app icon
}
