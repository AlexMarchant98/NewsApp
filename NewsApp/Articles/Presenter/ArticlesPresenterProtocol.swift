//
//  ArticlesPresenterProtocol.swift
//  NewsApp
//
//  Created by Alex Marchant on 04/02/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation

protocol ArticlesPresenterProtocol {
    func loadArticles()
    func viewArticle(_ article: Article)
}
