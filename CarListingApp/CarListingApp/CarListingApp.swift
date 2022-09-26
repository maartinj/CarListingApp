//
//  CarListingApp.swift
//  CarListingApp
//
//  Created by Marcin Jędrzejak on 02/09/2022.
//

import SwiftUI

@main
struct CarListingApp: App {
    var body: some Scene {
        WindowGroup {
            Home()
                .environmentObject(CarDetailsViewModel())
        }
    }
}
