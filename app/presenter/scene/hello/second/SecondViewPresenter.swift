//
//  FirstPresenter.swift
//  app
//
//  Created by Guilherme Cherubini on 21/03/18.
//  Copyright © 2018 Guilherme Cherubini. All rights reserved.
//

import Foundation

class SecondViewPresenter {
    
    enum PresenterError: Error {
        case somethingWentWrong
    }
    
    private weak var view: SecondView?
    
    init(view: SecondView?) {
        self.view = view
    }
    
    func greetingUser(userName: String) {
        let helloMessage = "Greetings \(userName) fella!"
        view?.showGreetingMessage(with: helloMessage)
    }
    
    func present(error: PresenterError) {
        let message = error.localizedDescription
        view?.showError(with: message)
    }
}

extension SecondViewPresenter.PresenterError: LocalizedError {
    var localizedDescription: String {
        switch self {
        case .somethingWentWrong:
            return "Erro ao carregar dados"
        }
    }
}
