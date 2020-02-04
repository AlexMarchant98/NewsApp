//
//  AppCoordinator.swift
//  NewsApp
//
//  Created by AlexMarchant on 20/01/2020.
//  Copyright © 2020 AlexMarchant. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    let newsService: NewsServiceProtocol
    let imageTransfererService: ImageTransfererProtocol
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.newsService = NewsService()
        self.imageTransfererService = ImageTransfererService()
        
        super.init()
        
        self.start()
    }
    
    override func start() {
        showArticles()
    }
    
    func showArticles() {
        let articlesCoordinator = ArticlesCoordinator(self.navigationController, self.newsService)
        articlesCoordinator.start()
        addChildCoordinator(articlesCoordinator)
    }
}
