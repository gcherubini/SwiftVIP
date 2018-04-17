//
//  SecondViewPresenter.swift
//  appTests
//
//  Created by Guilherme Cherubini on 21/03/18.
//  Copyright © 2018 Guilherme Cherubini. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import app

class SecondViewInteractorTest: QuickSpec {
    
    override func spec() {
        
        var interactor: SecondViewInteractor!
        var workerSpy: HelloPersistenceWorkerSpy!
        var presenterSpy: SecondViewPresenterSpy!
        
        describe("Interactor") {
            
            func setup(workerMock: HelloPersistenceWorker) {
                presenterSpy = SecondViewPresenterSpy(view: SecondViewMock())
                interactor = SecondViewInteractor(worker: workerMock, presenter: presenterSpy)
            }
            
            describe("When a name is requested") {
                context("And this is stored value is null") {
                    it("Pass an error to the presenter") {
                        setup(workerMock: HelloPersistenceWorkerNilMock())
                        interactor.getUserName()
                        expect(presenterSpy.error) == SecondViewPresenter.PresenterError.somethingWentWrong
                    }
                }
                
                context("And this is stored value is empty") {
                    it("Pass an error to the presenter") {
                        setup(workerMock: HelloPersistenceWorkerEmptyMock())
                        interactor.getUserName()
                        expect(presenterSpy.error) == SecondViewPresenter.PresenterError.somethingWentWrong
                    }
                }
                
                context("And this is not null/empty") {
                    it("Pass it to Presenter in order to greet user") {
                        setup(workerMock: HelloPersistenceWorkerSpy())
                        interactor.getUserName()
                        expect(presenterSpy.userName) == "God"
                    }
                }
            }
        }
    }
}

class HelloPersistenceWorkerSpy: HelloPersistenceWorker {
    override func getUserName() -> String? {
        return "God"
    }
}

class HelloPersistenceWorkerNilMock: HelloPersistenceWorker {
    override func getUserName() -> String? {
        return nil
    }
}

class HelloPersistenceWorkerEmptyMock: HelloPersistenceWorker {
    override func getUserName() -> String? {
        return ""
    }
}

class SecondViewPresenterSpy: SecondViewPresenter {
    var userName: String?
    var error: PresenterError?
    
    override func greetingUser(userName: String) {
        self.userName = userName
    }
    
    override func present(error: PresenterError) {
        self.error = error
    }
}

class SecondViewMock: SecondView {
    func showGreetingMessage(with message: String) {
    }
    
    func showError(with message: String) {
    }
}

