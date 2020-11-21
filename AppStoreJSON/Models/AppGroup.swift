//
//  AppGroup.swift
//  AppStoreJSON
//
//  Created by Saad Sherif on 11/17/20.
//

import Foundation


struct AppGroup: Codable {
    let feed: Feed
}

struct Feed: Codable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Codable {
    let id, name, artistName, artworkUrl100: String
}
