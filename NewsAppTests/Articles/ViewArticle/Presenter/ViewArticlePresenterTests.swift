//
//  ViewArticlePresenterTests.swift
//  NewsAppTests
//
//  Created by Alex Marchant on 05/02/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import XCTest
@testable import NewsApp

class ViewArticlePresenterTests: XCTestCase {
    
    var viewArticlePresenter: ViewArticlePresenter!
    var mockViewArticlePresenterView: MockViewArticlePresenterView!
    var mockViewArticlePresenterDelegate: MockViewArticlePresenterDelegate!

    override func setUp() {
        mockViewArticlePresenterView = MockViewArticlePresenterView()
        mockViewArticlePresenterDelegate = MockViewArticlePresenterDelegate()
        
        viewArticlePresenter = ViewArticlePresenter(with: mockViewArticlePresenterView, delegate: mockViewArticlePresenterDelegate)
        
        mockViewArticlePresenterView.resetCallCounts()
        mockViewArticlePresenterDelegate.resetCallCounts()
    }

    override func tearDown() {
        viewArticlePresenter = nil
        mockViewArticlePresenterView = nil
        mockViewArticlePresenterDelegate = nil
    }
    
    func testBackButtonTapped() {
        // Arrange/Act
        viewArticlePresenter.backButtonTapped()
        
        // Assert
        XCTAssertEqual(1, mockViewArticlePresenterDelegate.didTapBackCallCount)
    }

}
