//
//  ArticlesPresenter.swift
//  NewsApp
//
//  Created by Alex Marchant on 04/02/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation

protocol ArticlesPresenterView {
    func didLoadArticles(_ articles: Articles?)
}

protocol ArticlesPresenterDelegate {
    func didTapArticle(_ article: Article)
}

class ArticlesPresenter: ArticlesPresenterProtocol {
    let view: ArticlesPresenterView
    let delegate: ArticlesPresenterDelegate
    
    let newsService: NewsServiceProtocol
    
    init(
        _ newsService: NewsServiceProtocol,
        with view: ArticlesPresenterView,
        delegate: ArticlesPresenterDelegate) {
        
        self.newsService = newsService
        self.view = view
        self.delegate = delegate
    }
    
    func loadArticles() {
        let articles = newsService.getArticles()
        
        self.view.didLoadArticles(articles)
    }
    
    func viewArticle(_ article: Article) {
        self.delegate.didTapArticle(article)
    }
}
