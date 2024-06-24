//
//  NewsView.swift
//  KBTU WSP
//
//  Created by Arman Sarvadin on 05/12/2022.
//  Copyright © 2022 TEAM WSP. All rights reserved.
//

import SwiftUI

fileprivate enum NewsMocks {
    static let news: [News] = {
        var array: [News] = []
        for i in 0..<10 {
            let new = News(
                id: i,
                title: "Об отмене занятий профессора Исахова Алибека Абдиашимовича",
                postDate: Date(),
                comments: 12,
                haveSeen: false
            )
            array.append(new)
        }
        return array
    }()
}

struct NewsView: View {
    var showProfileButtonDidTap: (() -> Void)?
    var showNotificationsButtonDidTap: (() -> Void)?
    
    @ObservedObject var viewModel: NewsViewModel

    init(viewModel: NewsViewModel) {
        viewModel.configure(with: NewsMocks.news)
        self.viewModel = viewModel
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                ForEach(viewModel.news) { news in
                    NewsRowView(viewModel: NewsRowViewModel(news: news))
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
        .navigationTitle("Новости")
    }
}
