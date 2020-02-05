//
//  MockArticlesPresenterView.swift
//  NewsAppTests
//
//  Created by Alex Marchant on 05/02/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
@testable import NewsApp

class MockArticlesPresenterView: MockObjectProtocol, ArticlesPresenterView {
    
    var didLoadArticlesCallCount = 0
    
    func resetCallCounts() {
        didLoadArticlesCallCount = 0
    }
    
    func didLoadArticles(_ articles: Articles?) {
        didLoadArticlesCallCount += 1
    }
    
    
}
