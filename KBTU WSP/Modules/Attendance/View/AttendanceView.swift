//
//  AttendanceView.swift
//  KBTU WSP
//
//  Created by Arman Sarvadin on 11/12/2022.
//  Copyright © 2022 TEAM WSP. All rights reserved.
//

import SwiftUI

enum AttendanceMocks {
    static let attendance: [Attendance] = {
        var array: [Attendance] = []
        for i in 0...10 {
            let attend = Attendance(id: i, name: "Основы информационных систем", teacherName: "Жаксылыков Темирлан Мирамбекович", lecturePart: "Л1 (10:00 - 11:00)", openTime: 0)
            array.append(attend)
        }
        return array
    }()
}

struct AttendanceView: View {
    @ObservedObject var viewModel: AttendanceViewModel

    init(viewModel: AttendanceViewModel) {
        viewModel.configure(with: AttendanceMocks.attendance)
        self.viewModel = viewModel
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                ForEach(viewModel.attendance) { attendance in
                    AttendanceRowView(viewModel: AttendanceRowViewModel(attendance: attendance))
                }
            }
        }
        .toolbar {
            Button {
            } label: {
                Image(systemName: "bell.badge")
            }
        }
        .scrollIndicators(.hidden)
    }
}

struct AttendanceView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AttendanceView(viewModel: AttendanceViewModel())
        }
    }
}
