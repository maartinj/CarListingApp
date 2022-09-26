//
//  EmptyViewModel.swift
//  CarListingApp
//
//  Created by Marcin Jędrzejak on 26/09/2022.
//

import SwiftUI

struct EmptyViewModel: View {
    
    @Binding var findModel: String
    
    var body: some View {
        VStack(spacing: 10) {
            Text("There is no such 🚙 Model as:")
                .multilineTextAlignment(.center)
            Text("\(findModel)")
                .multilineTextAlignment(.center)
        }
    }
}

struct EmptyViewModel_Previews: PreviewProvider {
    static var previews: some View {
        EmptyViewModel(findModel: .constant("Series 1"))
    }
}
