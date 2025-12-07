//
//  ProfileViewModel.swift
//  StructAndClass
//
//  Created by Eder Barreto on 07/12/25.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var profile: UserProfile?
    
    private let service = UserService()
    
    func load() async {
        profile = try? await service.fetchProfile()
    }
}
