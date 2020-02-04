//
//  DataService.swift
//  NewsApp
//
//  Created by Alex Marchant on 03/02/2020.
//  Copyright © 2020 AlexMarchant. All rights reserved.
//

import Foundation

class NewsService: NewsServiceProtocol {
    
    init() {}
    
    func getArticles() -> Articles? {
        
        guard let path = Bundle.main.path(forResource: "Articles", ofType: "json") else {
            print("JSON File could not be found")
            return nil
        }
        
        do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decodedObject = try JSONDecoder().decode(Articles.self, from: data)
                return decodedObject
          } catch {
                print(error)
                return nil
          }
    }
}
