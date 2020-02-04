//
//  ImageDownloaderService.swift
//  NewsApp
//
//  Created by Alex Marchant on 03/02/2020.
//  Copyright © 2020 AlexMarchant. All rights reserved.
//

import Foundation

class ImageTransfererService: ImageTransfererProtocol {
    
    static var shared = ImageTransfererService()
    
    let urlSession: URLSession
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func downloadImage(urlString: String, completionHandler: @escaping ((Data?) -> Void)) {
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        let dataTask = urlSession.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error)
            }
            
            completionHandler(data)
        }
        
        dataTask.resume()
    }
}
