//
//  DetailPresenter.swift
//  FDJTest
//
//  Created by Mathias Erligmann on 14/09/2022.
//

import Foundation

class DetailPresenter {
    weak var viewController: DetailViewController?
    
    func presentTeam(team: Team) {
        viewController?.displayTitle(title: team.strTeam)
        viewController?.displayBanner(url: team.strTeamBanner)
        viewController?.displayCountry(country: team.strCountry)
        viewController?.displayChampionship(championship: team.strLeague)
        viewController?.displayDescription(description: team.strDescriptionEN)
    }
}
