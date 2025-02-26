//
//  
//  DetailView.swift
//  marvel
//
//  Created by andre mietti on 22/10/21.
//
//

import UIKit
import Kingfisher

public protocol DetailViewDelegate: AnyObject {}

class DetailView: SceneView {

    // MARK: - Properties
    private let containerView = configure(UIView()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .black
    }

    private let headerImageView = configure(UIImageView()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleToFill
        $0.clipsToBounds = true
    }

    private let titleLabel = configure(UILabel()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.boldSystemFont(ofSize: 26.0)
        $0.numberOfLines = 0
        $0.backgroundColor = .clear
        $0.textColor = .white
    }

    private let descriptionTextView = configure(UITextView()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isEditable = false
        $0.backgroundColor = .clear
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 20.0)
    }

    public var delegate: DetailViewDelegate?

    // MARK: - setup
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func buildViewHierarchy() {
        addSubview(containerView)
        containerView.addSubview(headerImageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(descriptionTextView)
    }

    override func setupConstraints() {
        containerView.constraint {[
            $0.topAnchor.constraint(equalTo: topAnchor),
            $0.bottomAnchor.constraint(equalTo: bottomAnchor),
            $0.leadingAnchor.constraint(equalTo: leadingAnchor),
            $0.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]}

        headerImageView.constraint {[
            $0.topAnchor.constraint(equalTo: containerView.topAnchor),
            $0.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            $0.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            $0.heightAnchor.constraint(equalTo: containerView.widthAnchor)
        ]}

        titleLabel.constraint {[
            $0.topAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: MAMetrics.mainTopSpace),
            $0.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: MAMetrics.mainLeadingSpace),
            $0.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: MAMetrics.mainTrailingSpace)
        ]}

        descriptionTextView.constraint {[
            $0.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: MAMetrics.mainTopSpace),
            $0.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: MAMetrics.mainLeadingSpace),
            $0.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: MAMetrics.mainTrailingSpace),
            $0.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: MAMetrics.mainTrailingSpace)
        ]}
    }

    // MARK: - Functional methods
    func setName(name: String) {
        titleLabel.text = name
    }

    func setDescription(description: String) {
        descriptionTextView.text = description == .defaultValue ? EmptyStateLocalize.descriptionNotFound.rawValue : description
    }

    func setIMage(imageUrl: URL) {
        headerImageView.kf.setImage(with: imageUrl)
    }
    
}
