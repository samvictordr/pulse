import Foundation
import Combine

class LiveStatusViewModel: ObservableObject {
    @Published var currentStatus: GameStatus?
    
    private var webSocketService = WebSocketService()
    private var cancellables = Set<AnyCancellable>()
    
    var username: String
    
    init(username: String) {
        self.username = username
    }
    
    func connectToLiveStatus() {
        webSocketService.connect(username: username)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Error connecting to live status: \(error)")
                }
            }, receiveValue: { [weak self] status in
                self?.currentStatus = status
            })
            .store(in: &cancellables)
    }
    
    func disconnectFromLiveStatus() {
        webSocketService.disconnect()
    }
}

// ...existing code...

