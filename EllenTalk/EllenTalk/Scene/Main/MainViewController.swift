//
//  MainViewController.swift
//  EllenTalk
//
//  Created by Ellen on 2022/02/06.
//

import UIKit

class MainViewController: UIViewController, MainViewDelegate {
    private lazy var mainView: MainView = .init(frame: view.bounds)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
}

extension MainViewController {
    private func setUp() {
        view = mainView
        mainView.delegate = self
    }
    
    func touchUpSignInButton() {
        print("TouchUpSignInButton Delegate")
        self.navigationController?.pushViewController(SignUpViewController(), animated: true)
    }
}
