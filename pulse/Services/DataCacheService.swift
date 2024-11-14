// Services/DataCacheService.swift
import Foundation

class DataCacheService {
    
    private let userCacheKey = "cachedUser"
    private let leaderboardCacheKey = "cachedLeaderboard"
    private let gameStatusCacheKey = "cachedGameStatus"
    
    private let userDefaults = UserDefaults.standard
    
    // MARK: - Cache User Data
    
    func cacheUserData(user: User) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(user)
            userDefaults.set(data, forKey: userCacheKey)
        } catch {
            print("Failed to cache user data: \(error)")
        }
    }
    
    func getUserData() -> User? {
        guard let data = userDefaults.data(forKey: userCacheKey) else {
            return nil
        }
        
        do {
            let decoder = JSONDecoder()
            let user = try decoder.decode(User.self, from: data)
            return user
        } catch {
            print("Failed to decode cached user data: \(error)")
            return nil
        }
    }
    
    // MARK: - Cache Leaderboard Data
    
    func cacheLeaderboardData(leaderboard: [LeaderboardEntry]) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(leaderboard)
            userDefaults.set(data, forKey: leaderboardCacheKey)
        } catch {
            print("Failed to cache leaderboard data: \(error)")
        }
        // ...existing code...
    }
    
    func getLeaderboardData() -> [LeaderboardEntry]? {
        guard let data = userDefaults.data(forKey: leaderboardCacheKey) else {
            return nil
        }
        
        do {
            let decoder = JSONDecoder()
            let leaderboard = try decoder.decode([LeaderboardEntry].self, from: data)
            return leaderboard
        } catch {
            print("Failed to decode cached leaderboard data: \(error)")
            return nil
        }
    }
    
    // MARK: - Cache Game Status Data
    
    func cacheGameStatusData(gameStatus: GameStatus) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(gameStatus)
            userDefaults.set(data, forKey: gameStatusCacheKey)
        } catch {
            print("Failed to cache game status data: \(error)")
        }
    }
    
    func getGameStatusData() -> GameStatus? {
        guard let data = userDefaults.data(forKey: gameStatusCacheKey) else {
            return nil
        }
        
        do {
            let decoder = JSONDecoder()
            let gameStatus = try decoder.decode(GameStatus.self, from: data)
            return gameStatus
        } catch {
            print("Failed to decode cached game status data: \(error)")
            return nil
        }
    }
    
    // MARK: - Clear Cache
    
    func clearCache() {
        userDefaults.removeObject(forKey: userCacheKey)
        userDefaults.removeObject(forKey: leaderboardCacheKey)
        userDefaults.removeObject(forKey: gameStatusCacheKey)
    }
}