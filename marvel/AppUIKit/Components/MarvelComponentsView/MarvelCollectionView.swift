
//
//  MarvelCollectionView.swift
//  Marvel
//
//  Created by andre mietti on 15/05/21.
//

import UIKit

protocol MarvelCollectionViewProtocol: AnyObject {
    func didSelectMarvelCharacter(character: CharacterResponseDataModel)
}

class MarvelCollectionView: SceneView {

    weak var delegate: MarvelCollectionViewProtocol?
    private let cellIdentifier = MainCharacterCell().reuseIdentifier.defaultValue
    private var characters: [CharacterResponseDataModel]?

    lazy var viewLayout = configure(UICollectionViewFlowLayout()) {
        $0.scrollDirection = .horizontal
    }

    private lazy var collectionView = configure(UICollectionView(frame: .zero, collectionViewLayout: viewLayout)) {
        $0.delegate = self
        $0.dataSource = self
        $0.register(MainCharacterCell.self, forCellWithReuseIdentifier: cellIdentifier)
        $0.showsVerticalScrollIndicator = false
        $0.showsHorizontalScrollIndicator = false
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = UIColor(_colorLiteralRed: 128.0/100, green: 128.0/100, blue: 128.0/100, alpha: 0.15)
        $0.reloadData()
    }

    override func buildViewHierarchy() {
        self.backgroundColor = .black
        addSubview(collectionView)
    }

    override func setupConstraints() {
        collectionView.constraint {[
            $0.topAnchor.constraint(equalTo: self.topAnchor),
            $0.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            $0.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            $0.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]}
    }

    func loadWithCharacters(characters: [CharacterResponseDataModel]) {
        self.characters = characters
        collectionView.reloadData()
    }
}

extension MarvelCollectionView: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let characters = self.characters else {
            return
        }
        delegate?.didSelectMarvelCharacter(character: characters[indexPath.row])
    }

}

extension MarvelCollectionView: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? MainCharacterCell else {
            return MainCharacterCell()
        }
        cell.configureCell(character: characters?[indexPath.row])
        return cell
    }

}

extension MarvelCollectionView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.makeSize()
    }

}
