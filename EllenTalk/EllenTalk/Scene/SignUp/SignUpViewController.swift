//
//  SignUpViewController.swift
//  EllenTalk
//
//  Created by Ellen on 2022/02/06.
//

import UIKit

class SignUpViewController: UIViewController {
    private lazy var signUpView: SignUpView = SignUpView(frame: view.bounds)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
         self.view.endEditing(true)
   }

    deinit {
        print("SignUpView was Deinitialized")
    }
}

extension SignUpViewController {
    private func setUp() {
        view = signUpView
        signUpView.backgroundColor = .white
    }
}
