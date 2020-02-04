//
//  Articles.swift
//  NewsApp
//
//  Created by Alex Marchant on 03/02/2020.
//  Copyright © 2020 AlexMarchant. All rights reserved.
//

import Foundation

struct Articles: Decodable {
    
    var articles: [Article]?
    
    init(articles: [Article]) {
        self.articles = articles
    }
    
}
