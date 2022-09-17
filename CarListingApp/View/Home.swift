//
//  Home.swift
//  CarListingApp
//
//  Created by Marcin Jędrzejak on 02/09/2022.
//

import SwiftUI

struct Home: View {
    
    init() {
        Theme.navigationBarColors(background: .white, titleColor: UIColor.init(ThemeColors.title))
    }
    
    @State private var cars: [CarDetailsModel] = []
    
    let columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 1)
    
    @StateObject private var vm = CarDetailsViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                
                background
                
                ScrollView {
                    
                    LazyVGrid(columns: columns, spacing: 5) {
                        
                        //ForEach(0...5, id: \.self) { car in
                        //ForEach(vm.cars, id: \.id) { car in
                        ForEach(cars, id: \.id) { car in
                            
                            CarItemDetails(car: car)
                            
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 10)
                    }
                }
            }
            .navigationTitle("CarListing")
            .onAppear {
                //vm.fetchCars()
                do {
                    let res = try StaticJSONMapper.decode(file: "CarList", type: CarDataModel.self)
                    
                    cars = res.data
                } catch {
                    //TODO: Handle any errors
                    print(error)
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

private extension Home {
    var background: some View {
        
        ThemeColors.background
            .ignoresSafeArea(edges: .top)
    }
}
