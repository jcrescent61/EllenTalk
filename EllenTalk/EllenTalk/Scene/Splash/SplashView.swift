//
//  SplashView.swift
//  EllenTalk
//
//  Created by Ellen on 2022/02/06.
//

import UIKit

class SplashView: UIView {
    
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.text = "Welcome!"
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpUI()
    }
}

extension SplashView {

    private func setUpUI() {
        self.backgroundColor = .init(named: "mainColor")
        addSubviews(welcomeLabel)
        
        NSLayoutConstraint.activate([
            welcomeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            welcomeLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
