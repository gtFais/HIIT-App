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
        VStack {
            Text(exerciseNames[index])
            Text("Video player")
            Text("Timer")
            Text("Start/Done Button")
            Text("Rating")
            Text("History Button")
        }
    }
}

struct ActionButton: View {
    let title: String
    
    var body: some View {
        Button {
            
        } label: {
            Text(title)
        }

    }
}



struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ExerciseView(index: 0)
        }
    }
}
