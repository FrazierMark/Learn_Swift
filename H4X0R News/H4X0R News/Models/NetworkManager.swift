//
//  NetworkManager.swift
//  H4X0R News
//
//  Created by Mark Frazier on 8/12/22.
//

import Foundation


class NetworkManager {
    
    func fetchData() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.data(with: url) {( data?, response, Error?) in
                if error == nil {
                    let decoder = JSONDecoder()
                    
                }
            }
        }
    }
    
}
