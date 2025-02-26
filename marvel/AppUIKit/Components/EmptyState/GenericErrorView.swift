//
//  GenericErrorView.swift
//  marvel
//
//  Created by andre mietti on 04/12/21.
//

import UIKit

final class GenericErrorView: SceneView {

    // MARK: - Properties
    private let containerView = configure(UIView()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .clear
    }

    private let marvelFailImageView = configure(UIImageView()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.backgroundColor = .lightGray
        $0.image = UIImage(named: "hulkMarvel")
    }

    private let failTitleLabel = configure(UILabel()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .clear
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.font = UIFont.boldSystemFont(ofSize: 16.0)
        $0.lineBreakMode = .byWordWrapping
        $0.textColor = .white
    }

    private let failMessageLabel = configure(UILabel()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .clear
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.font = UIFont.boldSystemFont(ofSize: 14.0)
        $0.lineBreakMode = .byWordWrapping
        $0.textColor = .white
    }

    private let goBackButton = configure(UIButton(type: .system)) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .red
        $0.setTitleColor(.white, for: .normal)
        $0.setTitle("Go back", for: .normal)
        $0.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        $0.contentEdgeInsets = UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8)
        $0.layer.cornerRadius = 10.0
    }

    // MARK: - setup
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func buildViewHierarchy() {
        addSubview(containerView)
        containerView.addSubview(marvelFailImageView)
        containerView.addSubview(failTitleLabel)
        containerView.addSubview(failMessageLabel)
        containerView.addSubview(goBackButton)
    }

    override func setupConstraints() {
        containerView.constraint {[
            $0.topAnchor.constraint(equalTo: topAnchor),
            $0.leadingAnchor.constraint(equalTo: leadingAnchor),
            $0.trailingAnchor.constraint(equalTo: trailingAnchor),
            $0.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]}

        marvelFailImageView.constraint {[
            $0.topAnchor.constraint(equalTo: containerView.topAnchor),
            $0.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            $0.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            $0.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ]}

        goBackButton.constraint {[
            $0.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: MAMetrics.mainBottomSpace),
            $0.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: MAMetrics.mainLeadingSpace),
            $0.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: MAMetrics.mainTrailingSpace),
            goBackButton.heightAnchor.constraint(equalToConstant: 44.0)
        ]}

        failMessageLabel.constraint {[
            $0.bottomAnchor.constraint(equalTo: goBackButton.topAnchor, constant: MAMetrics.mainBottomSpace),
            $0.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: MAMetrics.mainLeadingSpace),
            $0.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: MAMetrics.mainTrailingSpace)
        ]}

        failTitleLabel.constraint {[
            $0.bottomAnchor.constraint(equalTo: failMessageLabel.topAnchor, constant: MAMetrics.mainBottomSpace),
            $0.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: MAMetrics.mainLeadingSpace),
            $0.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: MAMetrics.mainTrailingSpace)
        ]}
    }

    // MARK: - Functional methods
    func setTitle(title: String, message: String) {
        failTitleLabel.text = title
        failMessageLabel.text = message
    }

    @objc private func goBack() {
        UIView.animate(withDuration: 0.3) {
            self.alpha = 0.0
        } completion: { finished in
            if finished {
                self.removeFromSuperview()
            }
        }
    }

    func showGenericErrorView() {
        guard let currentWindow: UIWindow = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else { return }
        currentWindow.addSubview(self)

        debugPrint("FRAME >>> \(self.frame)")
    }
}
