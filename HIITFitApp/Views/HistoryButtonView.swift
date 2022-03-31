//
//  HistoryButtonView.swift
//  HIITFitApp
//
//  Created by Flavius on 29/03/2022.
//

import SwiftUI

struct HistoryButtonView: View {
    @Binding var isHistoryViewVisible: Bool
    var body: some View {
        Button {
            isHistoryViewVisible.toggle()
        } label: {
            Text(NSLocalizedString("History", comment: "view user activity"))
        }
        .padding(.bottom)
    }
}

struct HistoryButtonView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryButtonView(isHistoryViewVisible: .constant(true))
    }
}
