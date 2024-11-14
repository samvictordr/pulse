import SwiftUI

struct UserProfileView: View {
    @ObservedObject var viewModel: UserProfileViewModel
    var body: some View {
        VStack(spacing: 16) {
            Text(viewModel.user.username)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Rank: #\(viewModel.user.bestGlobalRank)")
                .font(.headline)
            
            Text("Accuracy: \(viewModel.user.bestAccuracy, specifier: "%.2f")%")
                .font(.subheadline)
            
            Spacer()
        }
        .padding()
        .onAppear {
            viewModel.fetchUserProfile()
        }
    }

    struct UserProfileView_Previews: PreviewProvider {
        static var previews: some View {
            UserProfileView(viewModel: UserProfileViewModel(username: "testuser"))
        }
    }
}

// Ensure there is no UserProfileViewModel class here
