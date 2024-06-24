//
//  ProfileAssembly.swift
//  KBTU WSP
//
//  Created by Arman Sarvadin on 11/12/2022.
//  Copyright © 2022 TEAM WSP. All rights reserved.
//

import UIKit
import SwiftUI

// For module inputs and outputs
typealias ProfileConfiguration = (ProfileModuleInput) -> (Void)

enum ProfileMocks {
    static let studentProfile: StudentProfile = .init(
        studentID: "20B000077",
        firstName: "Студент",
        lastName: "Студентов",
        gpa: 4.00,
        faculty: .fit,
        avatar: Image(systemName: "person.circle.fill")
    )
}

final class ProfileModuleAssembly {
    /// Assembles Module components and returns a target controller
    ///
    /// - Parameter configuration: optional configuration closure called by module owner
    /// - Returns: Assembled module's ViewController
    func assemble(_ configuration: ProfileConfiguration? = nil) -> UIViewController {
        let viewModel = ProfileViewModel(studentProfile: ProfileMocks.studentProfile)
        let view = ProfileView(viewModel: viewModel)
        let hostingController = ProfileHostingController(rootView: view)
        hostingController.viewModel = viewModel
        configuration?(viewModel)
        return hostingController
    }
}
