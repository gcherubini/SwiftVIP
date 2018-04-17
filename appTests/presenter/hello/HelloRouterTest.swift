//
//  HelloRouterTest.swift
//  appTests
//
//  Created by Guilherme Cherubini on 16/04/18.
//  Copyright © 2018 Guilherme Cherubini. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import app

class HelloRouterTest: QuickSpec {
    
    override func spec() {
        
        var router: HelloRouter!
        var navigationMock: UINavigationController!

        describe("HelloRouter") {
            
            beforeEach {
                navigationMock = UINavigationController()
                router = HelloRouter(navigationController: navigationMock)
            }
            
            context("When it starts") {
                it("Navigate to initial screen") {
                    router.start()
                    expect(navigationMock.viewControllers).toNot(beNil())
                    expect(navigationMock.viewControllers[0] is FirstViewController) == true
                }
            }
            
            context("When it navigates") {
                it("To First Screen") {
                    router.navigate(to: .first)
                    expect(navigationMock.viewControllers).toNot(beNil())
                    expect(navigationMock.viewControllers[0] is FirstViewController) == true
                }
                
                it("To Second Screen") {
                    router.navigate(to: .second(userName: "God"))
                    expect(navigationMock.viewControllers).toNot(beNil())
                    expect(navigationMock.viewControllers[0] is SecondViewController) == true
                }
            }
        }
    }
}
