//
//  FirstViewPresenter.swift
//  appTests
//
//  Created by Guilherme Cherubini on 21/03/18.
//  Copyright © 2018 Guilherme Cherubini. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import app

class HelloSceneFactoryTest: QuickSpec {
    
    override func spec() {
        
        var factory: HelloSceneFactory!
        
        beforeEach {
            factory = HelloSceneFactory()
        }
        
        describe("HelloSceneFactory") {
        
            context("When creating first scene") {
                var scene: FirstViewController!
                
                beforeEach {
                    scene = factory.makeFirstScene()
                }
                
                it("Sets interactor") {
                    expect(scene.interactor).toNot(beNil())
                }
                
                it("Sets worker") {
                    expect(scene.interactor.worker).toNot(beNil())
                }
                
                it("Sets presenter") {
                    expect(scene.interactor.presenter).toNot(beNil())
                }
            }
            
            context("When creating second scene") {
                var scene: SecondViewController!
                
                beforeEach {
                    scene = factory.makeSecondScene(userName: "God")
                }
                
                it("Sets interactor") {
                    expect(scene.interactor).toNot(beNil())
                }
                
                it("Sets worker") {
                    expect(scene.interactor.worker).toNot(beNil())
                }
                
                it("Sets presenter") {
                    expect(scene.interactor.presenter).toNot(beNil())
                }
            }
        }
    }
}


