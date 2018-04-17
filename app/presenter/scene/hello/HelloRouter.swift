//
//  Router.swift
//  app
//
//  Created by Guilherme Cherubini on 21/03/18.
//  Copyright © 2018 Guilherme Cherubini. All rights reserved.
//

import UIKit

class HelloRouter: NavigatableScene {
    enum Scene {
        case first
        case second(userName: String)
    }
    
    private let navigationController: UINavigationController
    private let sceneFactory: HelloSceneFactory
    
    init(navigationController: UINavigationController = UINavigationController(), sceneFactory: HelloSceneFactory = HelloSceneFactory()) {
        self.navigationController = navigationController
        self.sceneFactory = sceneFactory
    }
    
    func start() {
        navigate(to: .first)
    }
    
    func navigate(to scene: Scene) {
        switch scene {
        case .first:
            showFirstScene()
        case .second(let userName):
            showSecondScene(with: userName)
        }
    }
}

private extension HelloRouter {
    func showFirstScene() {
        let firstScene = sceneFactory.makeFirstScene()
        
        firstScene.showSecondScene = { userName in
            self.navigate(to: .second(userName: userName))
        }
        
        navigationController.viewControllers = [firstScene]
    }
    
    func showSecondScene(with userName: String) {
        let helloScene = sceneFactory.makeSecondScene(userName: userName)
        navigationController.pushViewController(helloScene, animated: true)
    }
}
