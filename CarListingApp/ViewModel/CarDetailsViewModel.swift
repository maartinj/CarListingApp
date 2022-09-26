//
//  CarDetailsViewModel.swift
//  CarListingApp
//
//  Created by Marcin Jędrzejak on 02/09/2022.
//

import Foundation

final class CarDetailsViewModel: ObservableObject {
    
    @Published var cars: [CarDetailsModel] = []
    @Published var selection: Set<CarDetailsModel> = []
    @Published var filteredCars = [CarDetailsModel]()
    
    func fetchCars() {
        do {
            let res = try StaticJSONMapper.decode(file: "CarList", type: CarDataModel.self)
            
            cars = res.data
        } catch {
            //TODO: Handle any errors
            print(error)
        }
    }
    
    func selectDeselect(_ car: CarDetailsModel) {
        if selection.contains(car) {
            selection.remove(car)
        } else {
            selection.insert(car)
        }
    }
}
