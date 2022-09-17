//
//  CarListModel.swift
//  CarListingApp
//
//  Created by Marcin Jędrzejak on 02/09/2022.
//

import Foundation

// MARK: - CarDetailsModel
struct CarDetailsModel: Codable {
    let id: Int
    let consList: [String]
    let customerPrice: Int
    let make: String
    let marketPrice: Int
    let model: String
    let prosList: [String]
    let rating: Int
}
