//
//  ViewArticleViewControllerTests.swift
//  NewsAppTests
//
//  Created by Alex Marchant on 05/02/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import XCTest
@testable import NewsApp

class ViewArticleViewControllerTests: XCTestCase {
    
    let TITLE = "Title"
    let DESCRIPTION = "Description"
    let URL = "www.duckduckgo.com"
    let URL_TO_IMAGE = "Title"
    let PUBLISHED_AT = "01/01/2020"
    let SOURCE = ArticleSource(id: "id", name: "source")
    
    var viewArticleViewController: ViewArticleViewController!
    var mockViewArticlePresenter: MockViewArticlePresenter!
    var viewedArticle: Article!

    override func setUp() {
        mockViewArticlePresenter = MockViewArticlePresenter()
        viewedArticle = Article(title: TITLE, description: DESCRIPTION, url: URL, urlToImage: URL_TO_IMAGE, publishedAt: PUBLISHED_AT, articleSource: SOURCE)
        
        let navigationController = UINavigationController()
        
        viewArticleViewController = ViewArticleViewController.instantiate()
        viewArticleViewController.viewArticlePresenter = mockViewArticlePresenter
        viewArticleViewController.viewedArticle = viewedArticle
        
        navigationController.addChild(viewArticleViewController)
        
        XCTAssertNotNil(viewArticleViewController.view)
        
        mockViewArticlePresenter.resetCallCounts()
    }

    override func tearDown() {
        viewArticleViewController = nil
        mockViewArticlePresenter = nil
    }
    
    func testViewDidLoad() {
        // Arrange/Act
        viewArticleViewController.viewDidLoad()
        
        // Act
        XCTAssertTrue(viewArticleViewController.tableView.delegate is ViewArticleViewController)
        XCTAssertTrue(viewArticleViewController.tableView.dataSource is ViewArticleViewController)
    }
    
    func testViewWillAppear() {
        // Arrange/Act
        viewArticleViewController.viewWillAppear(true)
        
        // Act
        XCTAssertTrue((viewArticleViewController.navigationController?.navigationBar.isHidden)!)
    }
    
    func testViewWillDisappear() {
        // Arrange/Act
        viewArticleViewController.viewWillDisappear(true)
        
        // Act
        XCTAssertFalse((viewArticleViewController.navigationController?.navigationBar.isHidden)!)
    }
    
    func testBackButtonTapped() {
        // Arrange/Act
        viewArticleViewController.backButtonTapped(sender: (Any).self)
        
        // Assert
        XCTAssertEqual(1, mockViewArticlePresenter.backButtonTappedCallCount)
    }
    
    func testNumberOfSections() {
        // Arrange/Act
        let result = viewArticleViewController.numberOfSections(in: viewArticleViewController.tableView)
        
        // Assert
        XCTAssertEqual(1, result)
    }
    
    func testNumberOfRowsInSection() {
        // Arrange/Act
        let result = viewArticleViewController.tableView(viewArticleViewController.tableView, numberOfRowsInSection: 1)
        
        // Assert
        XCTAssertEqual(1, result)
    }
    
    func testCellForRowAt() {
        // Arrange
        let INDEX_PATH = IndexPath(row: 1, section: 1)
        
        // Act
        let result = viewArticleViewController.tableView(viewArticleViewController.tableView, cellForRowAt: INDEX_PATH)
        
        // Assert
        XCTAssertTrue(result is ViewArticleCell)
    }

}
