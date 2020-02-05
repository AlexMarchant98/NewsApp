//
//  ViewArticlePresenter.swift
//  NewsApp
//
//  Created by Alex Marchant on 05/02/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation

protocol ViewArticlePresenterView {
}

protocol ViewArticlePresenterDelegate {
    func didTapBack()
}


class ViewArticlePresenter: ViewArticlePresenterProtocol {
    let view: ViewArticlePresenterView
    let delegate: ViewArticlePresenterDelegate
    
    init(
        with view: ViewArticlePresenterView,
        delegate: ViewArticlePresenterDelegate) {
        
        self.view = view
        self.delegate = delegate
    }
    
    func backButtonTapped() {
        self.delegate.didTapBack()
    }
}
