//
//  ExerciseView.swift
//  HIITFitApp
//
//  Created by Flavius on 28/03/2022.
//

import SwiftUI
import AVKit

struct ExerciseView: View {
    let index: Int
    let videoNames = ["squat", "burpee", "step-up", "sun-salute"]
    let exerciseNames = ["Squat" , "Burpee", "Step Up", "Sun Salute"]
    let interval: TimeInterval = 30
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Header(titleText: exerciseNames[index])
                if let url = Bundle.main.url(forResource: videoNames[index], withExtension: ".mp4") {
                    VideoPlayer(player: AVPlayer(url: url))
                        .frame(height: geometry.size.height * 0.45)
                    
                } else {
                    Text("Couldn't find \(videoNames[index]).mp4")
                        .foregroundColor(.red)
                }
                Text(Date().addingTimeInterval(interval), style: .timer)
                    .font(.system(size: 50))
                var started = false
                Button {
                    started = !started
                } label: {
                    Text(started ? "Done" : "Start")
                        .font(.title3)
                }
                .padding(.bottom)

                RatingView()
                Spacer()
                Button {
                    
                } label: {
                    Text("History")
                }
                .padding(.bottom)
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
    static var previews: some View {
        VStack {
            ExerciseView(index: 0)
        }
    }
}
