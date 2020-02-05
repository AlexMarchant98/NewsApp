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
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButton.layer.cornerRadius = backButton.layer.bounds.height / 2
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: Constants.ViewArticleCellNibName, bundle: nil), forCellReuseIdentifier: Constants.ViewArticleCellIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func backButtonTapped(sender: Any) {
        viewArticlePresenter.backButtonTapped()
    }

}

extension ViewArticleViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ViewArticleCellIdentifier, for: indexPath) as! ViewArticleCell
        
        cell.article = viewedArticle
        
        return cell
    }
    
}

extension ViewArticleViewController: ViewArticlePresenterView {
    
}
