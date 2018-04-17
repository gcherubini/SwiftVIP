//
//  ViewController.swift
//  app
//
//  Created by Guilherme Cherubini on 20/03/18.
//  Copyright © 2018 Guilherme Cherubini. All rights reserved.
//

import UIKit

protocol FirstView: class {
    func showError(with message: String)
    func printMessage(_ message: String)
    func showSecondScene(with userName: String)
}

class FirstViewController: UIViewController {

    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    
    var interactor: FirstViewInteractor!
    var showSecondScene: ((String) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onPrimaryBtnClick(_ sender: UIButton) {
        interactor.persist(userName: nameTextField.text)
    }
}

extension FirstViewController: FirstView {
    func printMessage(_ message: String) {
        print(message)
    }

    func showSecondScene(with userName: String) {
        showSecondScene?(userName)
    }
}
