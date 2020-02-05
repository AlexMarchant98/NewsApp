//
//  ArticlesPresenterTests.swift
//  NewsAppTests
//
//  Created by Alex Marchant on 04/02/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import XCTest
@testable import NewsApp

class ArticlesPresenterTests: XCTestCase {
    
    var articlesPresenter: ArticlesPresenter!
    var mockNewsService: MockNewsService!
    var mockArticlesPresenterView: MockArticlesPresenterView!
    var mockArticlesPresenterDelegate: MockArticlesPresenterDelegate!

    override func setUp() {
        mockNewsService = MockNewsService()
        mockArticlesPresenterView = MockArticlesPresenterView()
        mockArticlesPresenterDelegate = MockArticlesPresenterDelegate()
        
        articlesPresenter = ArticlesPresenter(mockNewsService, with: mockArticlesPresenterView, delegate: mockArticlesPresenterDelegate)
        
        mockNewsService.resetCallCounts()
        mockArticlesPresenterView.resetCallCounts()
        mockArticlesPresenterDelegate.resetCallCounts()
    }

    override func tearDown() {
        articlesPresenter = nil
        mockNewsService = nil
        mockArticlesPresenterView = nil
        mockArticlesPresenterDelegate = nil
    }
    
    func testLoadArticles() {
        // Arrange/Act
        articlesPresenter.loadArticles()
        
        // Assert
        XCTAssertEqual(1, mockNewsService.getArticlesCallCount)
        
        XCTAssertEqual(1, mockArticlesPresenterView.didLoadArticlesCallCount)
    }
    
    func testViewArticle() {
        // Arrange
        let article = Article(title: "", description: "", url: "", urlToImage: "", publishedAt: "", articleSource: ArticleSource(id: "", name: ""))
        
        // Act
        articlesPresenter.viewArticle(article)
        
        // Assert
        XCTAssertEqual(1, mockArticlesPresenterDelegate.didTapArticleCallCount)
    }

}
