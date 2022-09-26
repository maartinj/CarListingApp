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
    
    @EnvironmentObject var vm: CarDetailsViewModel
    @State private var isExpanded: Bool = false
    @State private var selectedId: Int? = 1
    @State private var findMake: String = ""
    @State private var findModel: String = ""
    @State private var isToggled = false
    
    
    let columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 1)
    
    var body: some View {
        GeometryReader { geoSize in
            NavigationView {
                
                ZStack {
                    
                    background
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        filterView
                        
                        LazyVGrid(columns: columns, spacing: 5) {
                            
                            if !findMake.isEmpty == false && !findModel.isEmpty == false {
                                
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
                                
                            } else if findMake.isEmpty == false {
                                    
                                    ForEach(vm.cars.filter({ findMake.isEmpty ? true : $0.make.lowercased().contains(findMake.lowercased()) })) { car in
                                        CarItemDetails(geoAnimation: geoSize.size.width, car: car, isExpanded: vm.selection.contains(car), selectedId: $selectedId)
                                            .onTapGesture {
                                                withAnimation {
                                                    selectedId = selectedId == car.id ? nil : car.id
                                                }
                                            }
                                    }
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 10)
                                
                                } else if findModel.isEmpty == false {
                                    
                                    ForEach(vm.cars.filter({ findModel.isEmpty ? true : $0.model.lowercased().contains(findModel.lowercased()) })) { car in
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
                    .onAppear {
                        vm.fetchCars()
                    }
                    .overlay {
                        if findMake.isEmpty == false {
                            EmptyViewMake(findMake: $findMake)
                        } else if findModel.isEmpty == false {
                            EmptyViewModel(findModel: $findModel)
                        }
                    }
                }
                .navigationTitle("CarListing")
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

private extension Home {
    var filterView: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            
            HStack {
                Label {
                    Text("Filters")
                        .foregroundColor(ThemeColors.searchBarBackground)
                        .font(.headline)
                } icon: {
                    Image(systemName: "line.3.horizontal.decrease.circle")
                        .font(.system(size: 20))
                        .foregroundColor(ThemeColors.searchBarBackground)
                }
                .padding(.leading, 5)
                
                Spacer()
                
                Image(systemName: self.isToggled ? "chevron.up" : "chevron.down")
                    .padding(.trailing, 5)
            }
            .contentShape(Rectangle())
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    SearchBar(text: $findMake, placeholder: "Search By Make")
                        .padding(.top, 10)
                    
                    SearchBar(text: $findModel, placeholder: "Search By Model")
                        .padding(.top, 10)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            }
        }
        .onTapGesture {
            withAnimation {
                isToggled.toggle()
            }
        }
        .frame(height: isToggled ? nil : 20, alignment: .top)
        .padding(.horizontal, 10)
        .padding(.vertical, 15)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(.gray.opacity(0.2))
        )
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 15)
        .padding(.top, 15)
    }
}
