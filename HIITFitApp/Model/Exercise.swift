//
//  Constants.swift
//  HIITFitApp
//
//  Created by Flavius on 29/03/2022.
//

import Foundation

struct Exercise {
    let exerciseName: String
    let videoName: String
    
    enum ExerciseEnum: CustomStringConvertible {
        case squat
        case stepUp
        case burpee
        case sunSalute
        
        var description: String {
            switch self {
            case .squat:
                return NSLocalizedString("Squat", comment: "exercise")
            case .stepUp:
                return NSLocalizedString("Step Up", comment: "exercise")
            case .burpee:
                return NSLocalizedString("Burpee", comment: "exercise")
            case .sunSalute:
                return NSLocalizedString("Sun Salute", comment: "exercise")
            }
        }
    }
}

extension Exercise {
    static let exercises = [
        Exercise(exerciseName: ExerciseEnum.squat.description, videoName: "squat"),
        Exercise(exerciseName: ExerciseEnum.stepUp.description, videoName: "step-up"),
        Exercise(exerciseName: ExerciseEnum.burpee.description, videoName: "burpee"),
        Exercise(exerciseName: ExerciseEnum.sunSalute.description, videoName: "sun-salute")
    ]
}
