//
//  TitleTableViewCell.swift
//  Streaming_Service_MVVM
//
//  Created by Daniil Yarkovenko on 17.08.2022.
//

import UIKit

class TitleTableViewCell: UITableViewCell {

    //MARK: - Singletone

    static let identifier = "TitleTableViewCell"

    //MARK: - Views

    private lazy var playTitleButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30)), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        return label
    }()

    private lazy var titlePosterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(titlePosterImageView)
        contentView.addSubview(playTitleButton)

        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Private functions

    private func setupLayout() {
        titlePosterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        titlePosterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        titlePosterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        titlePosterImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true

        titleLabel.leadingAnchor.constraint(equalTo: titlePosterImageView.trailingAnchor, constant: 20).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.4).isActive = true

        playTitleButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        playTitleButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30).isActive = true
    }

    public func configure(with model: TitleViewModel) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else {
            return
        }
        titlePosterImageView.sd_setImage(with: url, completed: nil)
        titleLabel.text = model.titleName
    }


}
