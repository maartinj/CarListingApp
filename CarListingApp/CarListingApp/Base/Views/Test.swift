//
//  Test.swift
//  CarListingApp
//
//  Created by Marcin Jędrzejak on 17/09/2022.
//

import SwiftUI

struct TaskViewCollapsible: View {
    
    @State private var isDisclosed = false
    
    let header: String = "Review Page"
    let url: String
    let tasks: [String]
    
    var body: some View {
        VStack {
            HStack {
                VStack(spacing: 5) {
                    Text(header)
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundColor(.black)
                        .padding(.top, 10)
                        .padding(.horizontal, 20)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(url)
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(.black.opacity(0.4))
                        .padding(.horizontal, 20)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                Spacer()
                
                Image(systemName: self.isDisclosed ? "chevron.up" : "chevron.down")
                    .padding(.trailing)
                    .padding(.top, 10)
                
            }
            .onTapGesture {
                withAnimation {
                    isDisclosed.toggle()
                }
            }
            
            FetchTasks()
                .padding(.horizontal, 20)
                .padding(.bottom, 5)
                .frame(height: isDisclosed ? nil : 0, alignment: .top)
                .clipped()
        }
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(.black.opacity(0.2))
        )
        .frame(maxWidth: .infinity)
        .padding()
    }
    
    @ViewBuilder
    func FetchTasks() -> some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack {
                ForEach(0 ..< tasks.count, id: \.self) { value in
                    Text(tasks[value])
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(.black)
                        .padding(.vertical, 0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
        .frame(maxHeight: CGFloat(tasks.count) * 20)
    }
}

struct TaskViewCollapsible_Previews: PreviewProvider {
    static var previews: some View {
        TaskViewCollapsible(url: "trello.com", tasks: ["Hello", "Hello", "Hello"])
    }
}
