//
//  SplashView.swift
//  EllenTalk
//
//  Created by Ellen on 2022/02/06.
//

import UIKit

class SplashView: UIView {
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "ellenTalkLogo"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
}

extension SplashView {
    private func setUp() {
        setUpUI()
    }
    
    private func setUpUI() {
        self.backgroundColor = .init(named: "mainColor")
        addSubviews(logoImageView)
        
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 250),
            logoImageView.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
}
