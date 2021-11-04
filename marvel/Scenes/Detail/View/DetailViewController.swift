//
//  
//  DetailViewController.swift
//  marvel
//
//  Created by andre mietti on 22/10/21.
//
//
import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Metrics
    /*
     private enum Metrics {
         enum Label {
            static let top: CGFloat = 24.0
         }
     }
     **/
    
    // MARK: - Properties
    private let rootView = DetailView()
    private let viewModel: DetailViewModelProtocol

    // MARK: - ViewConreoller LifeCycle
    init(viewModel: DetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        self.addSceneViewToSafeArea(rootView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        rootView.delegate = self
        setupBinds()
        viewModel.loadContent()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationController()
    }

    private func setupNavigationController() {
        self.navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .red
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = .defaultValue
        title = "Detail"
    }

    // MARK: - Setup
    private func setupBinds() {
        viewModel.setName.observe(on: self) { [weak self] name in
            self?.rootView.setName(name: name)
        }

        viewModel.setDescription.observe(on: self) { [weak self] description in
            self?.rootView.setDescription(description: description)
        }

        viewModel.setImage.observe(on: self) { [weak self] imageUrl in
            self?.rootView.setIMage(imageUrl: imageUrl)
        }
    }

}

// MARK: - DetailViewDelegate
extension DetailViewController: DetailViewDelegate {}
