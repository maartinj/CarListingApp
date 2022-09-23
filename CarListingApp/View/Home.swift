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
    
    @State private var isExpanded: Bool = false
    @State private var selectedId: Int? = 1
    @EnvironmentObject var vm: CarDetailsViewModel
    
    let columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 1)
    
    var body: some View {
        GeometryReader { geoSize in
            NavigationView {
                ZStack {
                    
                    background
                    
                    ScrollView {
                        
                        LazyVGrid(columns: columns, spacing: 5) {
                            
                            ForEach(vm.cars) { car in
                                CarItemDetails(geoAnimation: geoSize.size.width, car: car, isExpanded: vm.selection.contains(car), selectedId: $selectedId)
                                    .onTapGesture {
                                        withAnimation {
                                            selectedId = selectedId == car.id ? nil : car.id
                                        }
                                    }
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 10)
                        }
                        
                    }
                }
                .navigationTitle("CarListing")
                .onAppear {
                    vm.fetchCars()
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(CarDetailsViewModel())
    }
}

private extension Home {
    var background: some View {
        
        ThemeColors.background
            .ignoresSafeArea(edges: .top)
    }
}
