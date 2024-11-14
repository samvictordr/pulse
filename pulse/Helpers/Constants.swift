// Define constants here

struct Constants {
    // Cache Keys
    static let userCacheKey = "cachedUser"
    static let leaderboardCacheKey = "cachedLeaderboard"
    static let gameStatusCacheKey = "cachedGameStatus"
    
    // API Endpoints
    static let baseURL = "https://osutrack-api.ameo.dev"
    static let getUserBestEndpoint = "/get_user_best/"
    static let leaderboardEndpoint = "/leaderboard"
    static let recentActivityEndpoint = "/recent_activity/"
    static let liveStatusEndpoint = "/live_status/"
}
