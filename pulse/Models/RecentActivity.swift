import Foundation

struct RecentActivity: Codable, Identifiable {
    let id = UUID()
    let beatmap: String
    let score: Int
    let date: Date
    
    enum CodingKeys: String, CodingKey {
        case beatmap = "beatmap_name"
        case score
        case date
    }
}

