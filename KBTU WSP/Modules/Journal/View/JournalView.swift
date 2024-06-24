//
//  JournalView.swift
//  KBTU WSP
//
//  Created by Arman Sarvadin on 11/12/2022.
//  Copyright © 2022 TEAM WSP. All rights reserved.
//

import SwiftUI

fileprivate enum JournalMocks {
    static let journals: [Journal] = {
        var array: [Journal] = []
        for i in 1..<10 {
            let journal = Journal(id: 1, name: "Лекция \(1)", date: Date(), status: .present, points: 1)
            array.append(journal)
        }
        return array
    }()
}

struct JournalView: View {
    var showProfileButtonDidTap: (() -> Void)?
    var showNotificationsButtonDidTap: (() -> Void)?
    
    @ObservedObject var viewModel: JournalViewModel

    init(viewModel: JournalViewModel) {
        viewModel.configure(with: JournalMocks.journals)
        self.viewModel = viewModel
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                ForEach(viewModel.journals) { journal in
                    JournalRowView(viewModel: JournalRowViewModel(journal: journal))
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    showProfileButtonDidTap?()
                } label: {
                    ProfileMocks.studentProfile.avatar
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showNotificationsButtonDidTap?()
                } label: {
                    Image(systemName: "bell.badge")
                }
            }
        }
        .scrollIndicators(.hidden)
        .navigationTitle("Журнал")
    }
}

struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            JournalView(viewModel: JournalViewModel())
        }
    }
}
