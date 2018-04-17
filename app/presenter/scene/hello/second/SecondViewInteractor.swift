//
//  SecondViewInteractor.swift
//  app
//
//  Created by Guilherme Cherubini on 13/04/18.
//  Copyright © 2018 Guilherme Cherubini. All rights reserved.
//

import Foundation

class SecondViewInteractor {
    
    let worker: HelloPersistenceWorker
    let presenter: SecondViewPresenter
    
    init(worker: HelloPersistenceWorker, presenter: SecondViewPresenter) {
        self.worker = worker
        self.presenter = presenter
    }
    
    func getUserName() {    
        guard let userName = worker.getUserName(), !userName.isEmpty else {
            presenter.present(error: .somethingWentWrong)
            return
        }
        
        presenter.greetingUser(userName: userName)
    }
}
