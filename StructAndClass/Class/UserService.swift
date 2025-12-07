//
//  UserService.swift
//  StructAndClass
//
//  Created by Eder Barreto on 07/12/25.
//

import Foundation

class UserService {
    func fetchProfile() async throws -> UserProfile {
        return UserProfile(id: "1", name: "Teste", avatarURL: "www.google.com.br")
    }
}
