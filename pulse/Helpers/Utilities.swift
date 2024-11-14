// Add utility functions here

import Foundation

struct Utilities {
    /// Handles errors by printing them to the console.
    static func handleError(_ error: Error) {
        print("An error occurred: \(error)")
    }
    
    /// Validates if a username meets the required format.
    static func isValidUsername(_ username: String) -> Bool {
        let regex = "^[a-zA-Z0-9_]{3,16}$"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: username)
    }
}
