//
//  ProfileViewModel.swift
//  KBTU WSP
//
//  Created by Arman Sarvadin on 11/12/2022.
//  Copyright © 2022 TEAM WSP. All rights reserved.
//

import Combine
import Foundation
import SwiftUI
import UIKit

final class ProfileViewModel: ObservableObject {
    @Published private(set) var studentProfile: StudentProfile

    var avatar: Image {
        studentProfile.avatar
    }

    var name: String {
        "\(studentProfile.firstName) \(studentProfile.lastName)"
    }

    var id: String {
        studentProfile.studentID
    }

    var gpa: String {
        "GPA: \(studentProfile.gpa)"
    }

    var faculty: String {
        switch studentProfile.faculty {
        case .fit:
            return "FIT"
        case .ngd:
            return "NGD"
        }
    }

    init(studentProfile: StudentProfile) {
        self.studentProfile = studentProfile
    }
    
    // MARK: - ProfileViewOutput methods
    func didLoad() {
        
    }
    
    func changeAppearance(isLight: Bool) {
        if isLight {
            UIApplication.shared.keyWindow?.overrideUserInterfaceStyle = .light
        } else {
            UIApplication.shared.keyWindow?.overrideUserInterfaceStyle = .dark
        }
        UserDefaults.standard.set(isLight, forKey: UserDefaultsNames.appAppearance)
    }
}

// MARK: - ProfileModuleInput methods
extension ProfileViewModel: ProfileModuleInput {
    func configure(data: ProfileConfigData) {
        
    }
}
