//
//  HomeInteractor.swift
//  FDJTest
//
//  Created by Mathias Erligmann on 13/09/2022.
//

import Foundation

class HomeInteractor {
    
    let presenter = HomePresenter()
    private let worker = HomeWorker()
    
    func searchChampionship(searchText: String) {
        worker.searchChampionship(searchText: searchText, completion: loadTeams(teams:))
    }
    
    func loadTeams(teams: [Team]) {
        presenter.presentTeams(teams: teams)
    }
    
    func loadDetail(team: Team) {
        presenter.presenDetail(team: team)
    }
}
