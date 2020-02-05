//
//  MockViewArticlePresenterDelegate.swift
//  NewsAppTests
//
//  Created by Alex Marchant on 05/02/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
@testable import NewsApp

class MockViewArticlePresenterDelegate: MockObjectProtocol, ViewArticlePresenterDelegate {
    
    var didTapBackCallCount = 0
    
    func resetCallCounts() {
        didTapBackCallCount = 0
    }
    
    func didTapBack() {
        didTapBackCallCount += 1
    }
}
