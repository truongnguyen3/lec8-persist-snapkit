//
//  BirdCollectionViewCell.swift
//  lec8
//
//  Created by Vin Bui on 10/31/23.
//

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

        // TODO: Unfilled or filled?
        starIcon.image = UIImage(systemName: "star.fill")
        starIcon.image = UIImage(systemName: "star")
    }

    // MARK: - Set Up Views

    private func setupBirdImage() {
        birdImage.contentMode = .scaleAspectFit

        contentView.addSubview(birdImage)
        birdImage.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            birdImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            birdImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            birdImage.heightAnchor.constraint(equalToConstant: 128),
            birdImage.widthAnchor.constraint(equalToConstant: 128)
        ])
    }

    private func setupNameLabel() {
        birdNameLabel.textColor = .label
        birdNameLabel.font = .systemFont(ofSize: 20, weight: .medium)

        contentView.addSubview(birdNameLabel)
        birdNameLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            birdNameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            birdNameLabel.topAnchor.constraint(equalTo: birdImage.bottomAnchor, constant: 4)
        ])
    }

    private func setupStarIcon() {
        contentView.addSubview(starIcon)
        starIcon.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            starIcon.topAnchor.constraint(equalTo: contentView.topAnchor),
            starIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            starIcon.widthAnchor.constraint(equalToConstant: 24),
            starIcon.heightAnchor.constraint(equalToConstant: 24)
        ])
    }

}
