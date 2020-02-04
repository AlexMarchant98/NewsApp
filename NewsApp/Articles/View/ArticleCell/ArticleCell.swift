//
//  ArticleTableViewCell.swift
//  NewsApp
//
//  Created by Alex Marchant on 03/02/2020.
//  Copyright © 2020 AlexMarchant. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {
    
    @IBOutlet weak private var articleImage: UIImageView!
    @IBOutlet weak private var title: UILabel!
    @IBOutlet weak private var publishedAt: UILabel!
    @IBOutlet weak private var activityIndicator: UIActivityIndicatorView!
    
    public var article: Article! {
        didSet {
            self.updateView()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateView() {
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
        
        ImageTransfererService.shared.downloadImage(urlString: article.urlToImage ?? "") { (imageData) in
            
            defer {
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.isHidden = true
                }
            }
            
            DispatchQueue.main.async {
                if let data = imageData {
                    self.articleImage.image = UIImage(data: data)
                } else {
                    self.articleImage.image = UIImage(named: "image-not-found")
                }
                self.setNeedsDisplay()
            }
            
        }
        self.title.text = article.title
        self.publishedAt.text = article.publishedAt
    }
    
}
