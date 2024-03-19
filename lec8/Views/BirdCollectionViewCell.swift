//
//  BirdCollectionViewCell.swift
//  lec8
//
//  Created by Vin Bui on 10/31/23.
//

import SnapKit
import UIKit

class BirdCollectionViewCell: UICollectionViewCell {

    // MARK: - Properties (view)

    private let birdImage = UIImageView()
    private let birdNameLabel = UILabel()
    private let starIcon = UIImageView()

    static let reuse = "BirdCollectionViewCellReuse"

    // MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupBirdImage()
        setupNameLabel()
        setupStarIcon()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - configure

    func configure(bird: Bird) {
        birdImage.image = UIImage(named: bird.image)
        birdNameLabel.text = bird.name

        // Check UserDefaults
        let favorites = UserDefaults.standard.array(forKey: "favorites") as? [String] ?? []
        if favorites.contains(bird.name) {
            // Is stored in favorites
            starIcon.image = UIImage(systemName: "star.fill")
        } else {
            // Not stored in favorites
            starIcon.image = UIImage(systemName: "star")
        }
    }

    // MARK: - Set Up Views

    private func setupBirdImage() {
        birdImage.contentMode = .scaleAspectFit

        contentView.addSubview(birdImage)

        birdImage.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalTo(128)
        }
    }

    private func setupNameLabel() {
        birdNameLabel.textColor = .label
        birdNameLabel.font = .systemFont(ofSize: 20, weight: .medium)

        contentView.addSubview(birdNameLabel)

        birdNameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(birdImage.snp.bottom).offset(4)
        }
    }

    private func setupStarIcon() {
        contentView.addSubview(starIcon)
        starIcon.translatesAutoresizingMaskIntoConstraints = false

        starIcon.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview()
            make.width.height.equalTo(24)
        }
    }

}
