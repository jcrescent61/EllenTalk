//
//  MainView.swift
//  EllenTalk
//
//  Created by Ellen on 2022/02/06.
//

import UIKit

protocol MainViewDelegate: AnyObject {
    func touchUpSignInButton()
}

class MainView: UIView {
    
    weak var delegate: MainViewDelegate?
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "ellenTalkLogo"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var signInButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("회원가입", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        button.backgroundColor = .init(named: "mainColor")
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(touchUpSignInButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
        setUpUI()
    }
}

extension MainView {
    private func setUp() {
        addSubviews(logoImageView, signInButton)
    }
    
    private func setUpUI() {
        
        // MARK: - logoImageView
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 300),
            logoImageView.widthAnchor.constraint(equalToConstant: 300)
        ])
        
        // MARK: - signInButton
        NSLayoutConstraint.activate([
            signInButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100),
            signInButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            signInButton.heightAnchor.constraint(equalToConstant: 60),
            signInButton.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    @objc
    private func touchUpSignInButton() {
        delegate?.touchUpSignInButton()
    }
}
