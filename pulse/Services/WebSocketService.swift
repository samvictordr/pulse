// Services/WebSocketService.swift
import Foundation
import Combine

class WebSocketService {
    private var timer: AnyCancellable?
    private let apiService = APIService()
    private let pollingInterval: TimeInterval = 5.0 // Poll every 5 seconds
    
    func connect(username: String) -> AnyPublisher<GameStatus, Error> {
        let subject = PassthroughSubject<GameStatus, Error>()
        
        timer = Timer.publish(every: pollingInterval, on: .main, in: .common)
            .autoconnect()
            .flatMap { _ -> AnyPublisher<GameStatus, Error> in
                self.apiService.getLiveStatus(username: username)
            }
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    subject.send(completion: .failure(error))
                }
            }, receiveValue: { status in
                subject.send(status)
            })
        
        return subject.eraseToAnyPublisher()
    }
    
    func disconnect() {
        timer?.cancel()
        timer = nil
    }
}