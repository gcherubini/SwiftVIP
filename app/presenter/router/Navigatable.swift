//
//  Navigatable.swift
//  app
//
//  Created by Guilherme Cherubini on 13/04/18.
//  Copyright © 2018 Guilherme Cherubini. All rights reserved.
//

import Foundation

protocol NavigatableRouter {
    associatedtype Router
    func navigate(to router: Router)
}

protocol NavigatableScene {
    associatedtype Scene
    func navigate(to scene: Scene)
}
