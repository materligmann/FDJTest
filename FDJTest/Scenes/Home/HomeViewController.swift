//
//  ViewController.swift
//  FDJTest
//
//  Created by Mathias Erligmann on 13/09/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let interactor = HomeInteractor()
    private let router = HomeRouter()
    
    private var teams: [Team]?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        configureBackground()
        configureSearch()
        configureCollectionView()
    }
    
    // MARK: Setup
    
    private func setup() {
        router.viewController = self
        interactor.presenter.viewController = self
    }
    
    // MARK: Configure
    
    private func configureBackground() {
        view.backgroundColor = .white
    }
    
    private func configureSearch() {
        let search = UISearchController()
        search.searchBar.placeholder = NSLocalizedString("searchLeagues", comment: "")
        search.searchBar.delegate = self
        navigationItem.searchController = search
    }
    
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 0
        collectionView.setCollectionViewLayout(layout, animated: false)
        collectionView.register(LogoCell.self, forCellWithReuseIdentifier: LogoCell.cellIdentifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    // MARK: Display
    
    func displayTeams(teams: [Team]) {
        self.teams = teams
        collectionView.reloadData()
    }
    
    // MARK: Navigate
    
    func navigateToDetail(team: Team) {
        router.routeToDetail(team: team)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teams?.count ?? 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LogoCell.cellIdentifier, for: indexPath) as? LogoCell, let team = teams?[indexPath.row] {
            cell.set(team: team)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let team = teams?[indexPath.row] {
            interactor.loadDetail(team: team)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 2, height: 150)
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        interactor.searchChampionship(searchText: searchText)
    }
}
