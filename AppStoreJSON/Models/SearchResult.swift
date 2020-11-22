//
//  SearchResult.swift
//  AppStoreJSON
//
//  Created by Saad Sherif on 11/15/20.
//

import Foundation

struct SearchResult: Codable {
    
    let resultCount: Int
    let results: [Result]
}

struct Result: Codable {
    let trackId: Int
    let trackName: String
    let primaryGenreName: String
    var averageUserRating: Float?
    let screenshotUrls: [String]
    let artworkUrl100: String // app icon
    var formattedPrice: String?
    let description: String
    var releaseNotes: String?
}
