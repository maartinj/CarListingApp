//
//  EmptyViewMake.swift
//  CarListingApp
//
//  Created by Marcin Jędrzejak on 26/09/2022.
//

import SwiftUI

struct EmptyViewMake: View {
    
    @Binding var findMake: String
    
    var body: some View {
        VStack(spacing: 10) {
            Text("There is no such 🚘 Make as:")
                .multilineTextAlignment(.center)
            Text("\(findMake)")
                .multilineTextAlignment(.center)
        }
    }
}

struct EmptyViewMake_Previews: PreviewProvider {
    static var previews: some View {
        EmptyViewMake(findMake: .constant("Mazda"))
    }
}
