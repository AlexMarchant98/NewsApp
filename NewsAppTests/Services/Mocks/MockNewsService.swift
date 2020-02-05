//
//  MockNewsService.swift
//  NewsAppTests
//
//  Created by Alex Marchant on 05/02/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
@testable import NewsApp

class MockNewsService: MockObjectProtocol, NewsServiceProtocol {
    
    var getArticlesCallCount = 0
    var getArticlesReturnValue: Articles?
    
    func resetCallCounts() {
        getArticlesCallCount = 0
    }
    
    func getArticles() -> Articles? {
        getArticlesCallCount += 1
        
        return getArticlesReturnValue
    }
    

}
