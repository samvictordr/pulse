//
//  UserUpdateResponse.swift
//  pulse
//
//  Created by Sam on 11/13/24.
//


struct UserUpdateResponse: Decodable {
    let username: String
    let mode: Int
    let playcount: Int
    let pp_rank: Int
    let pp_raw: Double
    let accuracy: Double
    let total_score: Int
    let ranked_score: Int
    let count300: Int
    let count50: Int
    let count100: Int
    let level: Double
    let count_rank_a: Int
    let count_rank_s: Int
    let count_rank_ss: Int
    let levelup: Bool
    let first: Bool
    let exists: Bool
    let newhs: [HighScore]
}

struct HighScore: Decodable {
    let beatmap_id: String
    let score_id: String
    let score: String
    let maxcombo: String
    let count50: String
    let count100: String
    let count300: String
    let countmiss: String
    let countkatu: String
    let countgeki: String
    let perfect: String
    let enabled_mods: String
    let user_id: String
    let date: String
    let rank: String
    let pp: String
    let replay_available: String
    let ranking: Int
}
