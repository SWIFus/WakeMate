//
//  Model.swift
//  wakemate
//
//  Created by BoMin on 2022/08/26.
//

import Foundation

struct WmTeam: Codable {
    let team_id: Int
//    let team_name: Int
//    let team_logo: Int
//    let team_message: String
//    let team_admin_id: Int
//    let team_wake_up: String
//    let rank_of_team: Int
    
//    enum CodingKeys: String, CodingKey {
//        case team_id = "team_id"
//    }
}

struct WmUser: Codable {
    let token: String
    let login_platform: String
    let user_id: Int
    let user_avatar: Int
    let user_name: String
    let is_wake_up: Int
    let user_wake_up: String
}

struct TeamandMem: Codable {
    let team: WmTeam
//    let users: [String: WmUser]
}

