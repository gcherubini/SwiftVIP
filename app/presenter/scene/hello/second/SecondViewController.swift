//
//  ViewController.swift
//  app
//
//  Created by Guilherme Cherubini on 20/03/18.
//  Copyright © 2018 Guilherme Cherubini. All rights reserved.
//

import UIKit

protocol SecondView: class {
    func showError(with message: String)
    func showGreetingMessage(with message: String)
}

class SecondViewController: UIViewController {

    @IBOutlet weak var helloLabel: UILabel!
    
    var interactor: SecondViewInteractor!

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.getUserName()
    }
}

extension SecondViewController: SecondView {
    func showGreetingMessage(with message: String) {
        helloLabel.text = message
    }
}
