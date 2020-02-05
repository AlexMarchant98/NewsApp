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
        
        viewArticleViewController = ViewArticleViewController.instantiate()
        viewArticleViewController.viewArticlePresenter = mockViewArticlePresenter
        viewArticleViewController.viewedArticle = viewedArticle
        
        XCTAssertNotNil(viewArticleViewController.view)
        
        mockViewArticlePresenter.resetCallCounts()
    }

    override func tearDown() {
        viewArticleViewController = nil
        mockViewArticlePresenter = nil
    }

}
