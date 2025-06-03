//
//  ViewController.swift
//  lec8
//
//  Created by Vin Bui on 10/31/23.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties (view)

    private var collectionView: UICollectionView!

    // MARK: - Properties (data)

    private var birds: [Bird] = [
        Bird(name: "Alden", image: "alden"),
        Bird(name: "Antoinette", image: "antoinette"),
        Bird(name: "Elvis", image: "elvis"),
        Bird(name: "Han", image: "han"),
        Bird(name: "Jennifer", image: "jennifer"),
        Bird(name: "Justin", image: "justin"),
        Bird(name: "Reade", image: "reade"),
        Bird(name: "Richie", image: "richie"),
        Bird(name: "Tiffany", image: "tiffany"),
        Bird(name: "Vin", image: "vin"),
        Bird(name: "Vivian", image: "vivian")
    ]

    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Birds"
        view.backgroundColor = UIColor.white

        setupCollectionView()
    }

    // MARK: - Set Up Views

    private func setupCollectionView() {
        // Create a FlowLayout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 16

        // Initialize CollectionView with the layout
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(BirdCollectionViewCell.self, forCellWithReuseIdentifier: BirdCollectionViewCell.reuse)
        collectionView.delegate = self
        collectionView.dataSource = self

        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}

// MARK: - UICollectionView DataSource

extension ViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return birds.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BirdCollectionViewCell.reuse, for: indexPath) as? BirdCollectionViewCell else { return UICollectionViewCell() }

        cell.configure(bird: birds[indexPath.row])
        return cell
    }

}

// MARK: - UICollectionViewDelegateFlowLayout

extension ViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.width / 2 - 16
        return CGSize(width: size, height: size)
    }

}

// MARK: - UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 1. get the bird at index
        let bird = birds[indexPath.row]
        
        // 2. fetch favorited birds with UserDefaults
        var favorites = UserDefaults.standard.array(forKey: "favorites") as? [String] ?? []
        
        // 3. toggle favorites
        if favorites.contains(bird.name) {
            // name is already stored in UserDefaults -> remove from favorites
            favorites.removeAll { name in
                name == bird.name
            }
        } else {
            favorites.append(bird.name)
        }
        
        // 4. update UserDefaults
        UserDefaults.standard.setValue(favorites, forKey: "favorites")
        
        collectionView.reloadData()
    }
}
