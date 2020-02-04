//
//  DataServiceProtocol.swift
//  NewsApp
//
//  Created by Alex Marchant on 03/02/2020.
//  Copyright © 2020 AlexMarchant. All rights reserved.
//

import Foundation

protocol NewsServiceProtocol {
    func getArticles() -> Articles?
}
