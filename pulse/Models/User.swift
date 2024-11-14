import Foundation

struct User: Codable, Identifiable {
    let id = UUID()
    let bestGlobalRank: Int
    let bestRankTimestamp: String
    let bestAccuracy: Float
    let bestAccTimestamp: String
    var username: String = "35011763" // Add username field here

    enum CodingKeys: String, CodingKey {
        case bestGlobalRank = "best_global_rank"
        case bestRankTimestamp = "best_rank_timestamp"
        case bestAccuracy = "best_accuracy"
        case bestAccTimestamp = "best_acc_timestamp"
    }
}

