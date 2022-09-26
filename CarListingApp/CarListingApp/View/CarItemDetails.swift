//
//  CarItemDetails.swift
//  CarListingApp
//
//  Created by Marcin Jędrzejak on 02/09/2022.
//

import SwiftUI

struct CarItemDetails: View {
    
    // Animation Image Effect
    var geoAnimation: CGFloat
    
    var car: CarDetailsModel
    let isExpanded: Bool
    
    @EnvironmentObject var vm: CarDetailsViewModel
    @Binding var selectedId: Int?
    
    var body: some View {
        
        VStack(spacing: .zero) {
            
            content
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 1)
    }
}

struct CarItemDetail_Previews: PreviewProvider {
    
    static var previewCar: CarDetailsModel {
        let cars = try! StaticJSONMapper.decode(file: "CarList", type: CarDataModel.self)
        
        return cars.data.first!
    }
    
    static var previews: some View {
        CarItemDetails(geoAnimation: 120, car: previewCar, isExpanded: false, selectedId: .constant(1))
    }
}

private extension CarItemDetails {
    
    var content: some View {
        HStack {
            Image(String("Car\(car.id)"))
                .resizable()
                .scaledToFill()
                .frame(width: geoAnimation * 0.5)
                .clipped()
            
            VStack(alignment: .leading) {
                Text("\(car.make) \(car.model)")
                    .foregroundColor(.black).bold()
                    .padding(.vertical, 1)
                Text("$\(car.marketPrice)")
                    .foregroundColor(.black.opacity(0.45))
                    .padding(.vertical, 1)
                Text("Rating:")
                    .padding(.vertical, 1)
                RatingView(rating: car.rating)
                    .font(.system(size: 15))
                Spacer()
                    .frame(height: 12)
                
                if selectedId == car.id {
                    expandedView()
                }
                
                Spacer()
                    .frame(height: 12)
                Button(selectedId == car.id ? "Hide Details" : "Show Details") {
                    vm.selectDeselect(car)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 12)
        }
    }
    
    @ViewBuilder
    func expandedView() -> some View {
        
        if car.prosList.isEmpty == false {
            
            VStack(alignment: .leading) {
                Spacer()
                    .frame(height: 12)
                Text("Pros:")
                    .font(.subheadline).bold()
                ForEach(0..<car.prosList.count, id: \.self) { value in
                    if String("\(car.prosList[value])").isEmpty == false {
                        Text("• \(car.prosList[value])")
                            .font(.caption)
                    }
                }
            }
        }
        
        if car.consList.isEmpty == false {
            
            VStack(alignment: .leading) {
                Spacer()
                    .frame(height: 12)
                Text("Cons:")
                    .font(.subheadline).bold()
                ForEach(0..<car.consList.count, id: \.self) { value in
                    if String("\(car.consList[value])").isEmpty == false {
                        Text("• \(car.consList[value])")
                            .font(.caption)
                    }
                }
            }
        }
    }
}
