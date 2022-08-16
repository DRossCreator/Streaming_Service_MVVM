//
//  HeroHeaderUIView.swift
//  Streaming_Service_MVVM
//
//  Created by Daniil Yarkovenko on 14.08.2022.
//

import UIKit

class HeroHeaderUIView: UIView {

    //MARK: - Views

    private lazy var heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "HeroImageViewImage")
        return imageView
    }()

    private lazy var playButton: UIButton = {
        let button = UIButton()
        button.setTitle("Play", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("Download", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    //MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
        addGradient()
        addSubview(buttonsStackView)
        buttonsStackView.addArrangedSubview(playButton)
        buttonsStackView.addArrangedSubview(downloadButton)
        setupLayout()
    }


    required init?(coder: NSCoder) {
        fatalError()
    }

    //MARK: - Override functions

    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }

    //MARK: - Private functions

    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor,
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }

    private func setupLayout() {
        playButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        downloadButton.widthAnchor.constraint(equalToConstant: 120).isActive = true

        buttonsStackView.centerYAnchor.constraint(equalTo: bottomAnchor, constant: -50).isActive = true
        buttonsStackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        buttonsStackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.75).isActive = true
    }

}
