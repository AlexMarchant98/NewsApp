//
//  MockArticlesPresenterDelegate.swift
//  NewsAppTests
//
//  Created by Alex Marchant on 05/02/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
@testable import NewsApp

class MockArticlesPresenterDelegate: MockObjectProtocol, ArticlesPresenterDelegate {
    
    var didTapArticleCallCount = 0
    
    func resetCallCounts() {
        didTapArticleCallCount = 0
    }
    
    func didTapArticle(_ article: Article) {
        didTapArticleCallCount += 1
    }
    

}
