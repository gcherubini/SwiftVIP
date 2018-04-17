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

class HelloPersistenceWorkerTest: QuickSpec {
    
    override func spec() {
        
        var worker: HelloPersistenceWorker!
        var userDefaultsSpy: UserDefaultsSpy!
        
        describe("PersistenceWorker") {
        
            beforeEach {
                userDefaultsSpy = UserDefaultsSpy()
                worker = HelloPersistenceWorker(defaults: userDefaultsSpy)
            }
            
            it("Persist an user name on UserDefaults") {
                worker.persist(userName: "God")
                expect(userDefaultsSpy.set?.key) == "userName"
                expect{ userDefaultsSpy.set?.value as? String } == "God"
            } 
            
            it("Get user name from UserDefaults") {
                _ = worker.getUserName()
                expect(userDefaultsSpy.string?.key) == "userName"
                expect{ userDefaultsSpy.string?.value as? String } == "God"
            }
        }
    }
}

class UserDefaultsSpy: UserDefaults {
    var set: (value:Any?, key: String)?
    var string: (value:Any?, key: String)?
    
    override func set(_ value: Any?, forKey key: String) {
        self.set = (value, key)
    }

    override func string(forKey defaultName: String) -> String? {
        self.string = ("God", defaultName)
        return nil
    }
}
