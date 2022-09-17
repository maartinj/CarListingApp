//
//  CarDetailsViewModel.swift
//  CarListingApp
//
//  Created by Marcin Jędrzejak on 02/09/2022.
//

import Foundation

final class CarDetailsViewModel: ObservableObject {
    
    @Published private(set) var cars: [CarDetailsModel] = []
    
    func fetchCars() {
        
    }
}
