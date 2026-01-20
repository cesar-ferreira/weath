//
//  CityService.swift
//  weath
//
//  Created by Cesar Ferreira Tavares Neto on 20/01/26.
//

import Alamofire
import Foundation

class CityService {
    static let shared = CityService()

    private init() {}

    func fetchCity(_ city: String, completion: @escaping (Result<CityModel, AFError>) -> Void) {
        let url = "https://geocoding-api.open-meteo.com/v1/search"
        let parameters: Parameters = [
            "name": city
        ]
        
        AF.request(url, method: .get, parameters: parameters)
            .validate() // Ensures the response has a valid status code
            .responseDecodable(of: CityModel.self) { response in
                switch response.result {
                case .success(let city):
                    completion(.success(city))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
