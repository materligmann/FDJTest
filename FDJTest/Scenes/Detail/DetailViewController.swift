//
//  DetailViewController.swift
//  FDJTest
//
//  Created by Mathias Erligmann on 14/09/2022.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    
    var team: Team?
    
    private let banner = UIImageView()
    private let countryLabel = UILabel()
    private let championshipLabel = UILabel()
    private let descriptionTextView = UITextView()
    
    private let interactor = DetailInteractor()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        configureBackground()
        configureBanner()
        configureCountryLabel()
        configureChampionshipLabel()
        configureDescriptionTextView()
        
        interactor.loadTeam()
    }
    
    // MARK: Setup
    
    private func setup() {
        interactor.team = team
        interactor.presenter.viewController = self
    }
    
    // MARK: Configure
    
    private func configureBackground() {
        view.backgroundColor = .white
    }
    
    private func configureBanner() {
        banner.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(banner)
        banner.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        banner.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
        banner.heightAnchor.constraint(equalToConstant: 75).isActive = true
        banner.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 0).isActive = true
    }
    
    private func configureCountryLabel() {
        countryLabel.textColor = .lightGray
        countryLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        countryLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(countryLabel)
        countryLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        countryLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
        countryLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        countryLabel.topAnchor.constraint(equalTo: banner.bottomAnchor, constant: 5).isActive = true
    }
    
    private func configureChampionshipLabel() {
        championshipLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        championshipLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(championshipLabel)
        championshipLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        championshipLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
        championshipLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        championshipLabel.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: 5).isActive = true
    }
    
    private func configureDescriptionTextView() {
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionTextView)
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        descriptionTextView.topAnchor.constraint(equalTo: championshipLabel.bottomAnchor, constant: 5).isActive = true
    }
    
    // MARK: Display
    
    func displayDescription(description: String?) {
        descriptionTextView.text = description
    }
    
    func displayChampionship(championship: String?) {
        championshipLabel.text = championship
    }
    
    func displayCountry(country: String?) {
        countryLabel.text = country
    }
    
    func displayTitle(title: String) {
        self.title = title
    }
    
    func displayBanner(url: String?) {
        if let url = url {
            banner.sd_setImage(with: URL(string: url))
        }
    }
}
