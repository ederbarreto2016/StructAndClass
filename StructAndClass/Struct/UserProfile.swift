//
//  UserProfile.swift
//  StructAndClass
//
//  Created by Eder Barreto on 07/12/25.
//

import Foundation

struct UserProfile: Codable, Identifiable {
    let id: String
    let name: String
    let avatarURL: String
}
