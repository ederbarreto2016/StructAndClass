//
//  ProfileView.swift
//  StructAndClass
//
//  Created by Eder Barreto on 07/12/25.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        VStack {
            if let profile = viewModel.profile {
                Text("Olá, \(profile.name)")
            }
        }
        .task {
            await viewModel.load()
        }
    }
}
