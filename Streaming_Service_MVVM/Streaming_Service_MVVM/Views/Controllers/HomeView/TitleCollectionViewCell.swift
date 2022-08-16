//
//  TitleCollectionViewCell.swift
//  Streaming_Service_MVVM
//
//  Created by Daniil Yarkovenko on 15.08.2022.
//

import UIKit
import SDWebImage

class TitleCollectionViewCell: UICollectionViewCell {

    //MARK: - Singletone

    static let identifier = "TitleCollectionViewCell"

    private lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    //MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    //MARK: - Override functions

    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }

    //MARK: - Public Functions

    public func configure(with model: String) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model)") else {
            return
        }

        posterImageView.sd_setImage(with: url, completed: nil)
    }
}
