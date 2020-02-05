//
//  ArticlesTableViewController.swift
//  iOSCourse-App1
//
//  Created by Alex Marchant on 03/02/2020.
//  Copyright © 2020 AlexMarchant. All rights reserved.
//

import UIKit

class ArticlesTableViewController: UITableViewController, Storyboarded {
    
    var articlesPresenter: ArticlesPresenterProtocol!
    var articles: Articles?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        articlesPresenter.loadArticles()
        
        tableView.register(UINib(nibName: Constants.ArticleCellNibName, bundle: nil), forCellReuseIdentifier: Constants.ArticleCellIdentifier)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles?.articles?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ArticleCellIdentifier, for: indexPath) as! ArticleCell
        
        let article = self.articles?.articles?[indexPath.item]
        
        cell.article = article
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = (self.articles!.articles?[indexPath.item])!
        
        articlesPresenter.viewArticle(article)
    }

}

extension ArticlesTableViewController: ArticlesPresenterView {
    func didLoadArticles(_ articles: Articles?) {
        self.articles = articles
    }
}
