//
//  Header.swift
//  HIITFitApp
//
//  Created by Flavius on 28/03/2022.
//

import SwiftUI

struct Header: View {
    let titleText: String
    var body: some View {
        VStack {
            Text(titleText)
                .font(.largeTitle)
            HStack {
                Image(systemName: "hand.wave")
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
                Image(systemName: "4.circle")
            }
            .font(.title)
        }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Header(titleText: "Squat")
                .previewLayout(.sizeThatFits)
            Header(titleText: "Squat")
                .preferredColorScheme(.dark)
                .environment(\.sizeCategory, .accessibilityLarge)
                .previewLayout(.sizeThatFits)
        }
    }
}
