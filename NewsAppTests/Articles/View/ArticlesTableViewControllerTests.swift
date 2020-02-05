//
//  ArticlesTableViewControllerTests.swift
//  NewsAppTests
//
//  Created by Alex Marchant on 04/02/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import XCTest
@testable import NewsApp

class ArticlesTableViewControllerTests: XCTestCase {
    
    var articlesTableViewController: ArticlesTableViewController!
    var mockArticlesPresenter: MockArticlesPresenter!

    override func setUp() {
        mockArticlesPresenter = MockArticlesPresenter()
        
        articlesTableViewController = ArticlesTableViewController()
        articlesTableViewController.articlesPresenter = mockArticlesPresenter
        
        XCTAssertNotNil(articlesTableViewController.view)
        
        mockArticlesPresenter.resetCallCounts()
    }

    override func tearDown() {
        articlesTableViewController = nil
        mockArticlesPresenter = nil
    }
    
    func testViewDidLoad() {
        // Arrange/Act
        articlesTableViewController.viewDidLoad()
        
        // Assert
        XCTAssertEqual(1, mockArticlesPresenter.loadArticlesCallCount)
    }
    
    func testNumberOfSections() {
        // Arrange/Act
        let result = articlesTableViewController.numberOfSections(in: articlesTableViewController.tableView)
        
        // Assert
        XCTAssertEqual(1, result)
    }
    
    func testNumberOfRowsInSection_ArticlesEmpty() {
        // Arrange/Act
        let result = articlesTableViewController.tableView(articlesTableViewController.tableView, numberOfRowsInSection: 0)
        
        // Assert
        XCTAssertEqual(0, result)
    }
    
    func testNumberOfRowsInSection_ArticlesNotEmpty() {
        // Arrange
        let articles = Articles(articles: [
            Article(title: "", description: "", url: "", urlToImage: "", publishedAt: "", articleSource: ArticleSource(id: "", name: "")),
            Article(title: "", description: "", url: "", urlToImage: "", publishedAt: "", articleSource: ArticleSource(id: "", name: "")),
            Article(title: "", description: "", url: "", urlToImage: "", publishedAt: "", articleSource: ArticleSource(id: "", name: ""))
        ])
        
        articlesTableViewController.articles = articles
        
        // Act
        let result = articlesTableViewController.tableView(articlesTableViewController.tableView, numberOfRowsInSection: 0)
        
        // Assert
        XCTAssertEqual(3, result)
    }
    
    func testCellForRowAt_ArticleIsNull() {
        // Arrange
        let INDEX_PATH = IndexPath(row: 0, section: 0)
        
        // Act
        let result = articlesTableViewController.tableView(articlesTableViewController.tableView, cellForRowAt: INDEX_PATH)
        
        // Assert
        XCTAssertTrue(result is ArticleCell)
    }
    
    func testCellForRowAt_ArticleExists() {
        // Arrange
        let INDEX_PATH = IndexPath(row: 0, section: 0)
        let articles = Articles(articles: [
            Article(title: "", description: "", url: "", urlToImage: "", publishedAt: "", articleSource: ArticleSource(id: "", name: ""))
        ])
        
        articlesTableViewController.articles = articles
        
        
        // Act
        let result = articlesTableViewController.tableView(articlesTableViewController.tableView, cellForRowAt: INDEX_PATH)
        
        // Assert
        XCTAssertTrue(result is ArticleCell)
    }
    
    func testDidSelectRowAt() {
        // Arrange
        let INDEX_PATH = IndexPath(row: 0, section: 0)
        let articles = Articles(articles: [
            Article(title: "", description: "", url: "", urlToImage: "", publishedAt: "", articleSource: ArticleSource(id: "", name: ""))
        ])
        
        articlesTableViewController.articles = articles
        
        // Act
        articlesTableViewController.tableView(articlesTableViewController.tableView, didSelectRowAt: INDEX_PATH)
        
        // Assert
        XCTAssertEqual(1, mockArticlesPresenter.viewArticleCallCount)
    }
    
    func testArticlesPresenterView_DidLoadArticles() {
        // Arrange
        let articles = Articles(articles: [
            Article(title: "", description: "", url: "", urlToImage: "", publishedAt: "", articleSource: ArticleSource(id: "", name: "")),
            Article(title: "", description: "", url: "", urlToImage: "", publishedAt: "", articleSource: ArticleSource(id: "", name: "")),
            Article(title: "", description: "", url: "", urlToImage: "", publishedAt: "", articleSource: ArticleSource(id: "", name: ""))
        ])
        
        // Act
        articlesTableViewController.didLoadArticles(articles)
        
        // Assert
        XCTAssertEqual(3, articles.articles!.count)
    }

}
