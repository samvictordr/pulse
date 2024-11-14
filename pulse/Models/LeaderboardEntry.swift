import Foundation

struct LeaderboardEntry: Codable, Identifiable {
    let id = UUID() // Using UUID for unique identification in SwiftUI lists, as JSON doesn't have a unique ID
    let user: Int
    let beatmapID: Int
    let score: Int
    let pp: Float
    let mods: Int
    let rank: String
    let scoreTime: String
    let updateTime: String
    
    enum CodingKeys: String, CodingKey {
        case user
        case beatmapID = "beatmap_id"
        case score
        case pp
        case mods
        case rank
        case scoreTime = "score_time"
        case updateTime = "update_time"
    }
}

