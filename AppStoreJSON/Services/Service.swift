//
//  Service.swift
//  AppStoreJSON
//
//  Created by Saad Sherif on 11/17/20.
//

import Foundation

class Service {
    
    static let shared = Service()
    
    func fetchApp(searchItem: String, completion: @escaping ([Result], Error?) -> ()) {
        
        let urlString = "https://itunes.apple.com/search?term=\(searchItem)&entity=software"
        
        guard let url = URL(string: urlString) else { return }
        // Fetch data Form internet
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Failed to fetch apps: \(error)")
                completion([], nil)
                return
            }
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                let searchResult = try decoder.decode(SearchResult.self, from: data)
                completion(searchResult.results, nil)
                
            } catch let jsonError {
                print("Failed to decode data: \(jsonError)")
                completion([], jsonError)
            }
            
            
        }.resume() // fires off the request
        
    }
}
