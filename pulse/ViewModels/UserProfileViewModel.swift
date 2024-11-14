import Foundation
import Combine

class UserProfileViewModel: ObservableObject {
    @Published var user: User = User(
        bestGlobalRank: 0,
        bestRankTimestamp: "Loading...",
        bestAccuracy: 0.0,
        bestAccTimestamp: "Loading..."
    )
    @Published var username: String = "makosam"
    
    private var apiService = APIService()
    private var cancellables = Set<AnyCancellable>()
    
    init(username: String) {
        self.username = username
        fetchUserProfile()
    }
    
    func fetchUserProfile() {
        print("Fetching profile for username: \(username)")
        apiService.getUserProfile(username: username)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Error fetching user profile: \(error)")
                }
            }, receiveValue: { [weak self] user in
                self?.user = user
            })
            .store(in: &cancellables)
    }
}

