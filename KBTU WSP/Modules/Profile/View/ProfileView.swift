//
//  ProfileView.swift
//  KBTU WSP
//
//  Created by Arman Sarvadin on 11/12/2022.
//  Copyright © 2022 TEAM WSP. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var viewModel: ProfileViewModel
    @AppStorage(UserDefaultsNames.appAppearance) var isLight: Bool = true

    var body: some View {
        List {
            HStack {
                Spacer()
                VStack(alignment: .center, spacing: 6) {
                    viewModel.avatar
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                    Text(viewModel.name)
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.primary)
                    Text(viewModel.id)
                    Text(viewModel.gpa)
                    Text(viewModel.faculty)
                }
                Spacer()
            }
            .foregroundColor(.secondary)
            
            Section {
                SettingsListRow(
                    title: "Профиль",
                    imageColor: Color.blue,
                    imageName: "person.fill"
                )
                SettingsSwitchRow(
                    title: "Внешний вид",
                    imageColor: Color.purple,
                    imageName: "moon.fill",
                    isOn: isLight
                ) { isOn in
                    viewModel.changeAppearance(isLight: isOn)
                }
                SettingsSwitchRow(
                    title: "Уведомления",
                    imageColor: Color.red,
                    imageName: "bell.fill"
                )
                SettingsListRow(
                    title: "Язык",
                    imageColor: Color.green,
                    imageName: "globe",
                    rightTitle: "Русский"
                )
            }
            
            Section {
                SettingsListRow(title: "Финансовый кабинет")
                SettingsListRow(title: "Транскрипт")
                SettingsListRow(title: "Просмотр регистрации")
            }
        }
    }
}
