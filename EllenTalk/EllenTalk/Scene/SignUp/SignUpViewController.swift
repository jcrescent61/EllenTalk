//
//  SignUpViewController.swift
//  EllenTalk
//
//  Created by Ellen on 2022/02/06.
//

import UIKit

class SignUpViewController: UIViewController, SignUpViewDelegate {
    private lazy var signUpView: SignUpView = SignUpView(frame: view.bounds)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }

    deinit {
        print("SignUpView was Deinitialized")
    }
}

extension SignUpViewController {
    private func setUp() {
        view = signUpView
        signUpView.delegate = self
    }
    
    func touchUpDoneButton() {
        print("DoneButton Delegate")
    }
}
