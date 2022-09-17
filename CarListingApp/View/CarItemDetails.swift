//
//  CarItemDetails.swift
//  CarListingApp
//
//  Created by Marcin Jędrzejak on 02/09/2022.
//

import SwiftUI

struct CarItemDetails: View {
    
    let car: CarDetailsModel
    
    var body: some View {
        
        VStack(spacing: .zero) {
            
            HStack {
                Image(String("Car\(car.id)"))
                    .resizable()
                    .frame(width: 200, height: 180)
                
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
                    // RatingView -> https://www.hackingwithswift.com/books/ios-swiftui/adding-a-custom-star-rating-component
                    Spacer()
                        .frame(height: 12)
                    Button {
                        
                    } label: {
                        Text("Show details")
                            .foregroundColor(ThemeColors.details).bold()
                            .padding(.vertical, 1)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 12)
            }
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 1)
        
        //    https://designcode.io/swiftui-handbook-clip-shape
    }
}

struct CarItemDetail_Previews: PreviewProvider {
    static var previewCar: CarDetailsModel {
        let cars = try! StaticJSONMapper.decode(file: "CarList", type: CarDataModel.self)
        
        return cars.data.first!
    }
    
    static var previews: some View {
        CarItemDetails(car: previewCar)
    }
}
