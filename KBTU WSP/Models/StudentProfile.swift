//
//  StudentProfile.swift
//  KBTU WSP
//
//  Created by Adam on 20.12.2022.
//

import Foundation
import SwiftUI

struct StudentProfile: Identifiable {
    let id = UUID().uuidString
    let studentID: String
    let firstName: String
    let lastName: String
    let gpa: Double
    let faculty: Faculty
    let avatar: Image
}

// TODO: - Перенести в отдельный файл с дополнениями

enum Faculty {
    case fit
    case ngd
}
