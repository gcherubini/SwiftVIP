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

class FirstViewPresenterTest: QuickSpec {
    
    override func spec() {
        
        var presenter: FirstViewPresenter!
        var viewSpy: FirstViewSpy!
        
        describe("Presenter") {
        
            beforeEach {
                viewSpy = FirstViewSpy()
                presenter = FirstViewPresenter(view: viewSpy)
            }
            
            describe("Print hello message") {
                it("Pass message to be shown to viewController") {
                    presenter.printHelloMessage(userName: "God")
                    expect(viewSpy.message) == "Hello God brother!"

                }
            }
            
            describe("Present second screen") {
                it("Pass user name to viewController") {
                    presenter.presentSecondScreen(userName: "God")
                    expect(viewSpy.userName) == "God"
                }
            }
            
            describe("Present an error") {
                it("Pass an error message to viewController") {
                    presenter.present(error: .somethingWentWrong)
                    expect(viewSpy.error) == "Erro de input"
                }
            }
        }
    }
}

class FirstViewSpy: FirstView {
    var userName: String?
    var message: String?
    var error: String?

    func showError(with message: String) {
        self.error = message
    }
    
    func printMessage(_ message: String) {
        self.message = message
    }
    
    func showSecondScene(with userName: String) {
        self.userName = userName
    }
}
