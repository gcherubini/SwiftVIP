//
//  Router.swift
//  app
//
//  Created by Guilherme Cherubini on 21/03/18.
//  Copyright © 2018 Guilherme Cherubini. All rights reserved.
//

import UIKit

class AppRouter: NavigatableRouter {
    
    enum Router {
        case hello
    }
    
    private let window: UIWindow
    private let navigationController: UINavigationController
    private var helloRouter: HelloRouter?
    
    init(window: UIWindow?, navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
        self.window = window ?? UIWindow()
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }
    
    func start() {
        navigate(to: .hello)
    }
    
    func navigate(to router: Router) {
        switch router {
        case .hello:
            startInitialRouter()
        }
    }
}

private extension AppRouter {
    func startInitialRouter() {
        helloRouter = HelloRouter(navigationController: navigationController)
        helloRouter?.start()
    }
}
