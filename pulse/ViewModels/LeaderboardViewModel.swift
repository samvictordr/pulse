import Foundation
import Combine

class LeaderboardViewModel: ObservableObject {
    @Published var leaderboardEntries: [LeaderboardEntry] = []
    private var apiService = APIService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchLeaderboard()
    }
    
    func fetchLeaderboard() {
        apiService.getLeaderboard()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Error fetching leaderboard: \(error)")
                }
            }, receiveValue: { [weak self] entries in
                self?.leaderboardEntries = entries
            })
            .store(in: &cancellables)
    }
}

