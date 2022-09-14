//
//  HomePresenter.swift
//  FDJTest
//
//  Created by Mathias Erligmann on 13/09/2022.
//

import Foundation

class HomePresenter {
    
    weak var viewController: HomeViewController?
    
    func presentTeams(teams: [Team]) {
        viewController?.displayTeams(teams: teams)
    }
    
    func presenDetail(team: Team) {
        viewController?.navigateToDetail(team: team)
    }
}
