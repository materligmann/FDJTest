//
//  HomeWorker.swift
//  FDJTest
//
//  Created by Mathias Erligmann on 13/09/2022.
//

import Foundation
import Alamofire

class HomeWorker {
    func searchChampionship(searchText: String, completion: @escaping ([Team]) -> Void) {
        let url = "https://www.thesportsdb.com/api/v1/json/50130162/search_all_teams.php"
        let parameters: Parameters = [
            "l": searchText
        ]
        AF.request(url,
                   method: .get,
                   parameters: parameters,
                   encoding: URLEncoding.default,
                   headers: nil,
                   interceptor: nil,
                   requestModifier: nil).responseDecodable(of: SearchTeamResponse.self) { response in
            switch response.result {
            case .success(let data):
                completion(data.teams)
            case .failure(let error):
                print(error.localizedDescription)
                completion([])
            }
        }
    }
}
