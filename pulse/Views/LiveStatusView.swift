// ViewModels/LiveStatusViewModel.swift
import Foundation
import Combine
import SwiftUI

import SwiftUI

struct LiveStatusView: View {
    @ObservedObject var viewModel: LiveStatusViewModel

    var body: some View {
        VStack(spacing: 16) {
            if let status = viewModel.currentStatus {
                Text("Current Beatmap: \(status.currentBeatmap)")
                    .font(.title)
                Text("Players Online: \(status.playersOnline)")
                    .font(.headline)
                Text("Online Status: \(status.isOnline ? "Online" : "Offline")")
                    .font(.subheadline)
            } else {
                Text("Loading Live Status...")
                    .font(.headline)
            }
            Spacer()
        }
        .padding()
        .onAppear {
            viewModel.connectToLiveStatus()
        }
        .onDisappear {
            viewModel.disconnectFromLiveStatus()
        }
    }

    struct LiveStatusView_Previews: PreviewProvider {
        static var previews: some View {
            LiveStatusView(viewModel: LiveStatusViewModel(username: "testuser"))
        }
    }
}
