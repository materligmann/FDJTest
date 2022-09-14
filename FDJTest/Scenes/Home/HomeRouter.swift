//
//  HomeRouter.swift
//  FDJTest
//
//  Created by Mathias Erligmann on 14/09/2022.
//

import Foundation

class HomeRouter {
    weak var viewController: HomeViewController?
    
    func routeToDetail(team: Team) {
        let detail = DetailViewController()
        detail.team = team
        viewController?.navigationController?.pushViewController(detail, animated: true)
    }
}
