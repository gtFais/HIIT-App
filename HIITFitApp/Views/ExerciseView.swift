//
//  ExerciseView.swift
//  HIITFitApp
//
//  Created by Flavius on 28/03/2022.
//

import SwiftUI

struct ExerciseView: View {
    let index: Int
    let videoNames = ["squat", "burpee", "step-up", "sun-salute"]
    let exerciseNames = ["Squat" , "Burpee", "Step Up", "Sun Salute"]
    var body: some View {
        Text(exerciseNames[index])
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(index: 0)
    }
}
