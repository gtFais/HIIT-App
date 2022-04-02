//
//  ExerciseView.swift
//  HIITFitApp
//
//  Created by Flavius on 28/03/2022.
//

import SwiftUI
import AVKit

struct ExerciseView: View {
    @Binding var selectedTab: Int
    @State private var rating = 0
    @State private var showSuccess = false
    @State private var isTimerDone = false
    @State private var showTimer = false
    @EnvironmentObject var history: HistoryStore
    let index: Int
    var isLastExercise: Bool {
        index + 1 == Exercise.exercises.count
    }
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Header(selectedTab: $selectedTab, titleText: Exercise.exercises[index].exerciseName)
                if let url = Bundle.main.url(forResource: Exercise.exercises[index].videoName, withExtension: ".mp4") {
                    VideoPlayer(player: AVPlayer(url: url))
                        .frame(height: geometry.size.height * 0.45)
                    
                } else {
                    Text("Couldn't find \(Exercise.exercises[index].videoName).mp4")
                        .foregroundColor(.red)
                }
                HStack(spacing: 150) {
                    
                    Button {
                        showTimer.toggle()
                    } label: {
                        Text(NSLocalizedString("Start", comment: "beggin exercise"))
                            .font(.title3)
                    }
                    .padding(.bottom)
                    
                    Button {
                        history.addDoneExercise(Exercise.exercises[index].exerciseName)
                        isTimerDone = false
                        showTimer.toggle()
                        if isLastExercise {
                            showSuccess.toggle()
                        } else {
                            selectedTab += 1
                        }
                    } label: {
                        Text(NSLocalizedString("Done", comment: "mark as finished"))
                            .font(.title3)
                    }
                    .padding(.bottom)
                    .disabled(!isTimerDone)
                    .sheet(isPresented: $showSuccess) {
                        SuccessView(selectedTab: $selectedTab)
                    }
                }
                .font(.title3)
                .padding()
                if showTimer {
                    TimerView(isTimerDone: $isTimerDone)
                }
                Spacer()
                RatingView(rating: $rating)
                    .padding()
            }
        }
    }
}

struct ExerciseView_Previews: PreviewProvider {
    let index = 0
    static var previews: some View {
        VStack {
            ExerciseView(selectedTab: .constant(0), index: 0)
        }
    }
}
