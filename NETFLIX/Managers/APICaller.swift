//
//  APICaller.swift
//  NETFLIX
//
//  Created by Shruti Makwana on 11/04/24.
//

import Foundation

struct Constants {
    static let API_KEY = "tt3896198&apikey=522ec836"
    static let baseURL = "https://www.omdbapi.com"
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (String) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/?i=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _ , error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                print(results)
            } catch {
                print(error.localizedDescription)
            }
            
        }
        task.resume()
    }
}
