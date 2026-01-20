//
//  CityModel.swift
//  weath
//
//  Created by Cesar Ferreira Tavares Neto on 20/01/26.
//

import Foundation

struct CityModel: Identifiable, nonisolated Decodable {
    
    let name: String
    let latitude: String
    let longitude: String
}
