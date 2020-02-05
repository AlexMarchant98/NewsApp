//
//  MockViewArticlePresenter.swift
//  NewsAppTests
//
//  Created by Alex Marchant on 05/02/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
@testable import NewsApp

class MockViewArticlePresenter: MockObjectProtocol, ViewArticlePresenterProtocol {

    var backButtonTappedCallCount = 0
    
    func resetCallCounts() {
        backButtonTappedCallCount = 0
    }
    
    func backButtonTapped() {
        backButtonTappedCallCount += 1
    }
    
}
