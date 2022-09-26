//
//  CarDataModel.swift
//  CarListingApp
//
//  Created by Marcin Jędrzejak on 02/09/2022.
//

import Foundation

// MARK: - Model
struct CarDataModel: Codable {
    let data: [CarDetailsModel]
}
