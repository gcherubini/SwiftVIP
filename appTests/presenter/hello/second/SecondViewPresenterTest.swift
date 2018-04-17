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

class SecondViewPresenterTest: QuickSpec {
    
    override func spec() {
        
        var presenter: SecondViewPresenter!
        var viewSpy: SecondViewSpy!
        
        describe("Presenter") {
        
            beforeEach {
                viewSpy = SecondViewSpy()
                presenter = SecondViewPresenter(view: viewSpy)
            }
            
            describe("Greeting user") {
                it("Passing a message to view") {
                    presenter.greetingUser(userName: "God")
                    expect(viewSpy.message) == "Greetings God fella!"
                }
            }
            
            describe("Present an error") {
                it("Pass an error message to viewController") {
                    presenter.present(error: .somethingWentWrong)
                    expect(viewSpy.error) == "Erro ao carregar dados"
                }
            }
        }
    }
}

class SecondViewSpy: SecondView {
    var message: String?
    var error: String?
    
    func showError(with message: String) {
        self.error = message
    }
    
    func showGreetingMessage(with message: String) {
        self.message = message
    }
}
