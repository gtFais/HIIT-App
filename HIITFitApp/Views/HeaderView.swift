//
//  Header.swift
//  HIITFitApp
//
//  Created by Flavius on 28/03/2022.
//

import SwiftUI

struct Header: View {
    @Binding var selectedTab: Int
    let titleText: String
    var body: some View {
        VStack {
            Text(titleText)
                .font(.largeTitle)
            HStack {
                ForEach (0 ..< Exercise.exercises.count, id: \.self) { index in
                    let fill = index == selectedTab ? ".fill" : ""
                    Image(systemName: "\(index + 1).circle\(fill)")
                }
            }
            .font(.title2)
        }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Header(selectedTab: .constant(0), titleText: "Squat")
                .previewLayout(.sizeThatFits)
            Header(selectedTab: .constant(0), titleText: "Squat")
                .preferredColorScheme(.dark)
                .environment(\.sizeCategory, .accessibilityLarge)
                .previewLayout(.sizeThatFits)
        }
    }
}
