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
    @Binding var isHistoryViewVisible: Bool
    let index: Int
    let interval: TimeInterval = 30
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
                Text(Date().addingTimeInterval(interval), style: .timer)
                    .font(.system(size: 50))
                HStack(spacing: 150) {
                    Button {
                        
                    } label: {
                        Text(NSLocalizedString("Start", comment: "beggin exercise"))
                            .font(.title3)
                    }
                    .padding(.bottom)
                    Button {
                        selectedTab = isLastExercise ? 9 : selectedTab + 1
                    } label: {
                        Text(NSLocalizedString("Done", comment: "mark as finished"))
                            .font(.title3)
                    }
                    .padding(.bottom)
                }
                RatingView()
                Spacer()
                HistoryButtonView(isHistoryViewVisible: $isHistoryViewVisible)
            }
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
    let index = 0
    static var previews: some View {
        VStack {
            ExerciseView(selectedTab: Binding(projectedValue: .constant(0)), isHistoryViewVisible: .constant(false), index: 0)
        }
    }
}
