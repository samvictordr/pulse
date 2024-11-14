import Foundation

struct GameStatus: Codable {
    let isOnline: Bool
    let currentBeatmap: String
    let playersOnline: Int
    
    enum CodingKeys: String, CodingKey {
        case isOnline = "is_online"
        case currentBeatmap = "current_beatmap"
        case playersOnline = "players_online"
    }
}

