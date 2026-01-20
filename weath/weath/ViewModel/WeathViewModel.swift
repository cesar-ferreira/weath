//
//  WeathViewModel.swift
//  weath
//
//  Created by Cesar Ferreira Tavares Neto on 20/01/26.
//

import SwiftUI
import Combine

class WeathViewModel: ObservableObject {
    @Published var city: CityModel? // List of users
    @Published var isLoading: Bool = false // Tracks loading status
    @Published var errorMessage: String? = ""// Stores error messages if any
    
    @Published var debouncedCity: String?
    

    func loadCity() {
        isLoading = true
        errorMessage = nil

        CityService.shared.fetchCity("Tokyo", completion: { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let city):
                    self?.city = city
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
        )
    }
    
    
    
    func setupCityDebounce() {
        debouncedCity = self.city?.name
        $city
            .debounce(for: .seconds(0.75), scheduler: RunLoop.main)
            .assign(to: &$city)
        
        loadCity()
    }
    
}
