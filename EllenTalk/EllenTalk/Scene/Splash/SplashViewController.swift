//
//  SplashViewController.swift
//  EllenTalk
//
//  Created by Ellen on 2022/02/06.
//

import Foundation
import UIKit

class SplashViewController: UIViewController {
    private lazy var splashView: SplashView = .init(frame: view.bounds)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
}

extension SplashViewController {
    private func setUp() {
        view = splashView
    }
}
