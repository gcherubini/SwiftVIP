//
//  FirstViewInteractor.swift
//  app
//
//  Created by Guilherme Cherubini on 13/04/18.
//  Copyright © 2018 Guilherme Cherubini. All rights reserved.
//

import Foundation

class FirstViewInteractor {
    
    let worker: HelloPersistenceWorker
    let presenter: FirstViewPresenter
    
    init(worker: HelloPersistenceWorker, presenter: FirstViewPresenter) {
        self.worker = worker
        self.presenter = presenter
    }
    
    func persist(userName: String?) {
        guard let userName = userName, !userName.isEmpty else {
            presenter.present(error: .somethingWentWrong)
            return
        }
        
        worker.persist(userName: userName)
        presenter.presentSecondScreen(userName: userName)
    }
}
