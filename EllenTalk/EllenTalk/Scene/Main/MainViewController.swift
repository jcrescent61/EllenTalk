//
//  MainViewController.swift
//  EllenTalk
//
//  Created by Ellen on 2022/02/06.
//

import UIKit

class MainViewController: UIViewController {
    private lazy var mainView: MainView = MainView(frame: view.bounds)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
}

extension MainViewController {
    private func setUp() {
        view = mainView
    }
}
