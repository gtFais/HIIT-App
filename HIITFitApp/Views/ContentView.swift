//
//  ContentView.swift
//  HIITFitApp
//
//  Created by Flavius on 28/03/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 9
    @State private var showHistory = false
    @EnvironmentObject var history: HistoryStore
    var body: some View {
        if showHistory {
            HistoryView(showHistory: $showHistory)
        } else {
            TabView(selection: $selectedTab) {
                VStack {
                    WelcomeView(selectedTab: $selectedTab)
                        .tag(9)
                    HistoryButtonView(showHistory: $showHistory)
                }
                ForEach(0 ..< Exercise.exercises.count, id: \.self) { index in
                    VStack {
                        ExerciseView(selectedTab: $selectedTab, index: index)
                            .tag(index)
                        HistoryButtonView(showHistory: $showHistory)
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .environmentObject(history)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(HistoryStore())
    }
}
