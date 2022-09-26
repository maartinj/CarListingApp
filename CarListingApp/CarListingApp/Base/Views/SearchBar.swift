//
//  SearchBar.swift
//  CarListingApp
//
//  Created by Marcin Jędrzejak on 25/09/2022.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    @State var placeholder: String
    @State private var isEditing = false
    
    var body: some View {
        HStack {
            
            TextField(placeholder, text: $text)
                .placeholder(when: text.isEmpty) {
                    Text(placeholder).foregroundColor(.gray)
                }
                .padding(7)
                .padding(.horizontal, 25)
                .background(ThemeColors.searchBarBackground)
                .foregroundColor(.white)
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if isEditing {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
                .onTapGesture {
                    withAnimation {
                        self.isEditing = true
                    }
                }
            
            if isEditing {
                
                Button {
                    self.isEditing = false
                    self.text = ""
                    
                    // Dismiss the keyboard
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                } label: {
                    Text("Cancel")
                        .foregroundColor(ThemeColors.searchBarBackground)
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""), placeholder: "Search")
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}
