import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            UserProfileView(viewModel: UserProfileViewModel(username: "35011763"))
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
                }

            LeaderboardView(viewModel: LeaderboardViewModel())
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Leaderboard")
                }

            LiveStatusView(viewModel: LiveStatusViewModel(username: "35011763"))
                .tabItem {
                    Image(systemName: "waveform")
                    Text("Live Status")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

