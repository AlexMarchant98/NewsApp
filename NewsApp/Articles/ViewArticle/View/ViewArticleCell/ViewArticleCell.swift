//
//  ViewArticleCell.swift
//  NewsApp
//
//  Created by Alex Marchant on 05/02/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import UIKit

class ViewArticleCell: UITableViewCell {
    
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var story: UILabel!
    @IBOutlet weak var publishTime: UILabel!
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

        // Configure the view for the selected state
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
        self.story.text = article.description
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        let dateObj = dateFormatter.date(from: article.publishedAt!)

        dateFormatter.dateFormat = "dd/MM/yyyy hh:mm"
        
        self.publishTime.text = dateFormatter.string(from: dateObj!)
    }
    
}
