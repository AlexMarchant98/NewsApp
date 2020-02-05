//
//  ArticleViewController.swift
//  iOSCourse-App1
//
//  Created by Alex Marchant on 03/02/2020.
//  Copyright © 2020 AlexMarchant. All rights reserved.
//

import UIKit

class ViewArticleViewController: UIViewController, Storyboarded {
    
    var viewArticlePresenter: ViewArticlePresenterProtocol!
    var viewedArticle: Article!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension ViewArticleViewController: ViewArticlePresenterView {
    
}
