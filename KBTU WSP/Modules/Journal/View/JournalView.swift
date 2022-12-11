//
//  JournalView.swift
//  KBTU WSP
//
//  Created by Arman Sarvadin on 11/12/2022.
//  Copyright © 2022 TEAM WSP. All rights reserved.
//

import SwiftUI

struct JournalView: View {
    @ObservedObject var viewModel: JournalViewModel
    var body: some View {
        Text("Hello world!")
    }
}

struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            JournalView(viewModel: JournalViewModel())
        }
    }
}