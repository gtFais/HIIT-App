//
//  ContentView.swift
//  HIITFitApp
//
//  Created by Flavius on 28/03/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 9
    @State private var isHistoryViewVisible = false
    var body: some View {
        if isHistoryViewVisible {
            HistoryView()
        } else {
            TabView(selection: $selectedTab) {
                WelcomeView(selectedTab: $selectedTab, isHistoryViewVisible: $isHistoryViewVisible)
                    .tag(9)
                ForEach(0 ..< Exercise.exercises.count, id: \.self) { index in
                    ExerciseView(selectedTab: $selectedTab, isHistoryViewVisible: $isHistoryViewVisible, index: index)
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
