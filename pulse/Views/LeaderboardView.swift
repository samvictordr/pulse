import SwiftUI

struct LeaderboardView: View {
    @ObservedObject var viewModel: LeaderboardViewModel

    var body: some View {
        List(viewModel.leaderboardEntries) { entry in
            HStack {
                Text("#\(entry.rank)")
                    .font(.headline)
                
                VStack(alignment: .leading) {
                    // Display user ID in place of username if it's not available
                    Text("User ID: \(entry.user)")
                        .font(.subheadline)
                    
                    Text("PP: \(entry.pp, specifier: "%.2f")")
                        .font(.subheadline)
                }
            }
        }
        .onAppear {
            viewModel.fetchLeaderboard()
        }
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView(viewModel: LeaderboardViewModel())
    }
}

