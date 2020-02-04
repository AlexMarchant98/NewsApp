//
//  MockArticlesPresenter.swift
//  NewsAppTests
//
//  Created by Alex Marchant on 04/02/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
@testable import NewsApp

class MockArticlesPresenter: MockObjectProtocol, ArticlesPresenterProtocol {
    
    var loadArticlesCallCount = 0
    var viewArticleCallCount = 0
    
    func resetCallCounts() {
        self.loadArticlesCallCount = 0
        self.viewArticleCallCount = 0
    }
    
    func loadArticles() {
        loadArticlesCallCount += 1
    }
    
    func viewArticle(_ article: Article) {
        viewArticleCallCount += 1
    }
    
    
}
