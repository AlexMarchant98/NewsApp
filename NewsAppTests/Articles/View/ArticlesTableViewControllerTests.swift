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

}
