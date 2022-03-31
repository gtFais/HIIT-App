//
//  HistoryStore.swift
//  HIITFitApp
//
//  Created by Flavius on 30/03/2022.
//

import Foundation

struct ExerciseDay: Identifiable {
    var id = UUID()
    let date: Date
    var exercises: [String] = []
}

struct HistoryStore {
    var exerciseDays: [ExerciseDay] = []
    
    init() {
        #if DEBUG
        createDevData()
        #endif
    }
}
