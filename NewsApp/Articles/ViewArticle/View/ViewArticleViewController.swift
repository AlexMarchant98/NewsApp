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
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: Constants.ViewArticleCellNibName, bundle: nil), forCellReuseIdentifier: Constants.ViewArticleCellIdentifier)
    }

}

extension ViewArticleViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ViewArticleCellIdentifier, for: indexPath) as! ViewArticleCell
        
        cell.article = viewedArticle
        
        return cell
    }
    
}

extension ViewArticleViewController: ViewArticlePresenterView {
    
}
