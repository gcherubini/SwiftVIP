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

class FirstViewInteractorTest: QuickSpec {
    
    override func spec() {
        
        var interactor: FirstViewInteractor!
        var workerSpy: FirstViewPersistenceWorkerSpy!
        var presenterSpy: FirstViewPresenterSpy!
        
        describe("Interactor") {
        
            beforeEach {
                workerSpy = FirstViewPersistenceWorkerSpy()
                presenterSpy = FirstViewPresenterSpy(view: FirstViewMock())
                interactor = FirstViewInteractor(worker: workerSpy, presenter: presenterSpy)
            }
            
            describe("When a name is received") {
                context("And this is null") {
                    it("Pass an error to the presenter") {
                        interactor.persist(userName: nil)
                        expect(presenterSpy.error) == FirstViewPresenter.PresenterError.somethingWentWrong
                    }
                }
                
                context("And this is empty") {
                    it("Pass an error to the presenter") {
                        interactor.persist(userName: "")
                        expect(presenterSpy.error) == FirstViewPresenter.PresenterError.somethingWentWrong
                    }
                }
                
                context("And this is not null/empty") {
                    it("Pass it to Persistence Worker") {
                        interactor.persist(userName: "God")
                        expect(workerSpy.userName) == "God"
                        expect(presenterSpy.userName) == "God"
                    }
                }
            }
        }
    }
}

class FirstViewPersistenceWorkerSpy: HelloPersistenceWorker {
    var userName: String?

    override func persist(userName: String) {
        self.userName = userName
    }
}

class FirstViewPresenterSpy: FirstViewPresenter {
    var userName: String?
    var error: PresenterError?
    
    override func printHelloMessage(userName: String) {
        self.userName = userName
    }
    
    override func presentSecondScreen(userName: String) {
        self.userName = userName
    }
    
    override func present(error: PresenterError) {
        self.error = error
    }
}

class FirstViewMock: FirstView {
    func showError(with message: String) {
    }
    
    func printMessage(_ message: String) {
    }
    
    func showSecondScene(with userName: String) {
    }
}

