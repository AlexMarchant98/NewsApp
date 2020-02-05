//
//  ArticlesCoordinator.swift
//  iOSCourse-App1
//
//  Created by Alex Marchant on 03/02/2020.
//  Copyright © 2020 AlexMarchant. All rights reserved.
//

import Foundation
import UIKit

class ArticlesCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    let newsService: NewsServiceProtocol
    
    init(
        _ navigationController: UINavigationController,
        _ newsService: NewsServiceProtocol) {
        
        self.navigationController = navigationController
        self.newsService = newsService
        
        super.init()
    }
    
    override func start() {
        showArticles()
    }
    
    func showArticles() {
        let viewController = ArticlesTableViewController.instantiate()
        
        let articlesPresenter = ArticlesPresenter(newsService, with: viewController, delegate: self)
        
        viewController.articlesPresenter = articlesPresenter
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    func showArticle(_ article: Article) {
        let viewController = ViewArticleViewController.instantiate()
        let viewArticlePresenter = ViewArticlePresenter(with: viewController, delegate: self)

        viewController.viewArticlePresenter = viewArticlePresenter
        viewController.viewedArticle = article

        self.navigationController.pushViewController(viewController, animated: true)
    }
}

extension ArticlesCoordinator: ArticlesPresenterDelegate {
    func didTapArticle(_ article: Article) {
        self.showArticle(article)
    }
}

extension ArticlesCoordinator: ViewArticlePresenterDelegate {
    func didTapBack() {
        self.navigationController.popViewController(animated: true)
    }
    
}
