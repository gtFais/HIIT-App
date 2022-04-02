//
//  HistoryView.swift
//  HIITFitApp
//
//  Created by Flavius on 29/03/2022.
//

import SwiftUI

struct HistoryView: View {
    @Binding var showHistory: Bool
    @EnvironmentObject var history: HistoryStore
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Button {
                
            } label: {
                Image(systemName: "xmark.circle")
                    .onTapGesture {
                        showHistory = false
                    }
            }
            .font(.title)
            .padding(.trailing)

            VStack {
                Text(NSLocalizedString("History", comment: "view user activity"))
                    .font(.title)
                    .padding()
                Form {
                    ForEach(history.exerciseDays) { day in
                        Section {
                            ForEach(day.exercises, id: \.self) { exercise in
                                Text(exercise)
                            }
                        } header: {
                            Text(day.date.formatted(as: "MMM d"))
                                .font(.headline)
                        }

                    }
                }
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(showHistory: .constant(true))
            .environmentObject(HistoryStore())
    }
}
