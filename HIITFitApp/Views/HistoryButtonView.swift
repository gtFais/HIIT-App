//
//  HistoryButtonView.swift
//  HIITFitApp
//
//  Created by Flavius on 29/03/2022.
//

import SwiftUI

struct HistoryButtonView: View {
    @Binding var showHistory: Bool
    var body: some View {
        Button {
            showHistory.toggle()
        } label: {
            Text(NSLocalizedString("History", comment: "view user activity"))
        }
        .padding(.bottom)
    }
}

struct HistoryButtonView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryButtonView(showHistory: .constant(true))
    }
}
