//
//  SuccessView.swift
//  HIITFitApp
//
//  Created by Flavius on 29/03/2022.
//

import SwiftUI

struct SuccessView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedTab: Int
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "hand.raised.fill")
                .resizedToFill(width: 75, height: 75)
                .foregroundColor(.purple)
                .padding(.bottom)
            Text("High Five!")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("""
                 Good job completing all four exercises!
                 Remember tomorrow's another day.
                 So eat well and get some rest.
                 """)
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
            Spacer()
            Button {
                presentationMode.wrappedValue.dismiss()
                selectedTab = 9
            } label: {
                Text("Continue")
                    .padding(.bottom)
            }

        }
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView(selectedTab: .constant(0))
    }
}
