//
//  HelloSceneFactory.swift
//  app
//
//  Created by Guilherme Cherubini on 13/04/18.
//  Copyright © 2018 Guilherme Cherubini. All rights reserved.
//

import UIKit

struct HelloSceneFactory {
    
    func makeFirstScene() -> FirstViewController {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
        let presenter = FirstViewPresenter(view: viewController)
        let worker = HelloPersistenceWorker()
        viewController.interactor = FirstViewInteractor(worker: worker, presenter: presenter)
        return viewController
    }
    
    func makeSecondScene(userName: String) -> SecondViewController {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        let presenter = SecondViewPresenter(view: viewController)
        let worker = HelloPersistenceWorker()
        viewController.interactor = SecondViewInteractor(worker: worker, presenter: presenter)
        return viewController
    }
}
