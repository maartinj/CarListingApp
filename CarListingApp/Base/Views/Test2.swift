//
//  Test2.swift
//  CarListingApp
//
//  Created by Marcin Jędrzejak on 19/09/2022.
//

import SwiftUI

struct Test2: View {
    
    @State private var toggleView: Int? = nil  // << selection
    
    var numberOfItems: Int = 5
    
        var body: some View {
            GeometryReader { geometry in
                VStack(spacing: 40.0) {
                    ForEach(0...5, id: \.self) {item in
                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                if self.toggleView == item { // << here !!
                                    self.toggleView = nil
                                } else {
                                    self.toggleView = item
                                }
                           }
                       })
                       {
                        VStack {
                           HStack {
                                Text("Button Text")
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                    .font(.callout)

                                Spacer()

                                Text("Description")
                                    .fontWeight(.bold)
                                    .foregroundColor(.gray)
                                    .font(.callout)
                                }
                            if self.toggleView == item { // << selection !!
//                                HiddenDescriptionView()
                                Text("Done as expected")
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                    .font(.callout)
                            }
                           }
                           .frame(width: geometry.size.width/1.3)
                       }

                       .padding(23.0)
                       .background(Color.white)

                   }
                    .clipShape(RoundedRectangle(cornerRadius: 32))
                    .shadow(color: .gray, radius: 15)
               }
            }
        }
}

struct Test2_Previews: PreviewProvider {
    static var previews: some View {
        Test2()
    }
}
