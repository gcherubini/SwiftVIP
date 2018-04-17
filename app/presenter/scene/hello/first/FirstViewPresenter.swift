//
//  FirstPresenter.swift
//  app
//
//  Created by Guilherme Cherubini on 21/03/18.
//  Copyright © 2018 Guilherme Cherubini. All rights reserved.
//

import Foundation

class FirstViewPresenter {
    
    enum PresenterError: Error {
        case somethingWentWrong
    }
    
    private weak var view: FirstView?
    
    init(view: FirstView?) {
        self.view = view
    }
    
    func printHelloMessage(userName: String) {
        let helloMessage = "Hello \(userName) brother!"
        view?.printMessage(helloMessage)
    }
    
    func presentSecondScreen(userName: String) {
        view?.showSecondScene(with: userName)
    }
    
    func present(error: PresenterError) {
        let message = error.localizedDescription
        view?.showError(with: message)
    }
}

extension FirstViewPresenter.PresenterError: LocalizedError {
    var localizedDescription: String {
        switch self {
        case .somethingWentWrong:
            return "Erro de input"
        }
    }
}
