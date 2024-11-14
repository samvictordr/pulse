import Foundation
import Combine

class APIService {
    private let baseURL = "https://osutrack-api.ameo.dev"

    private func validateJSON(data: Data) throws -> Data {
        guard JSONSerialization.isValidJSONObject(data) || (try? JSONSerialization.jsonObject(with: data)) != nil else {
            if let responseString = String(data: data, encoding: .utf8) {
                print("Non-JSON response: \(responseString)")
            }
            throw URLError(.cannotParseResponse)
        }
        return data
    }

    // Fetch user profile information
    func getUserProfile(username: String) -> AnyPublisher<User, Error> {
        guard let url = URL(string: "\(baseURL)/peak?user=\(username)&mode=0") else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        print("Fetching user profile from URL: \(url.absoluteString)")

        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { output in
                guard let httpResponse = output.response as? HTTPURLResponse else {
                    throw URLError(.badServerResponse)
                }
                print("HTTP Status Code: \(httpResponse.statusCode)")
                guard httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return try self.validateJSON(data: output.data)
            }
            .decode(type: [User].self, decoder: JSONDecoder()) // Decode as an array of User
            .tryMap { userArray in
                guard let user = userArray.first else {
                    throw URLError(.cannotParseResponse) // Handle empty array case
                }
                return user
            }
            .eraseToAnyPublisher()
    }

    // Fetch leaderboard information
    func getLeaderboard() -> AnyPublisher<[LeaderboardEntry], Error> {
        guard let url = URL(string: "\(baseURL)/bestplays?mode=0") else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { output in
                guard let httpResponse = output.response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return try self.validateJSON(data: output.data)
            }
            .decode(type: [LeaderboardEntry].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

    // Fetch recent activity information
    func getRecentActivity(username: String) -> AnyPublisher<[RecentActivity], Error> {
        guard let url = URL(string: "\(baseURL)/recent_activity/\(username)") else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { output in
                guard let httpResponse = output.response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return try self.validateJSON(data: output.data)
            }
            .decode(type: [RecentActivity].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

    // Fetch live game status
    func getLiveStatus(username: String) -> AnyPublisher<GameStatus, Error> {
        guard let url = URL(string: "\(baseURL)/live_status/\(username)") else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { output in
                guard let httpResponse = output.response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return try self.validateJSON(data: output.data)
            }
            .decode(type: GameStatus.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

    // Update user data
    func updateUser(username: String, mode: Int) -> AnyPublisher<UserUpdateResponse, Error> {
        guard let url = URL(string: "\(baseURL)/update?user=\(username)&mode=\(mode)") else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { output in
                guard let httpResponse = output.response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return try self.validateJSON(data: output.data)
            }
            .decode(type: UserUpdateResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

