//
//  DetailInteractor.swift
//  FDJTest
//
//  Created by Mathias Erligmann on 14/09/2022.
//

import Foundation

class DetailInteractor {
    var team: Team?
    let presenter = DetailPresenter()
    
    
    func loadTeam() {
        if let team = team {
            presenter.presentTeam(team: team)
        }
    }
}
