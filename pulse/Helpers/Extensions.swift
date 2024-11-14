import Foundation

extension Date {
    /// Formats the date to a readable string.
    func toReadableString() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: self)
    }
}

extension String {
    /// Trims whitespace and newlines from both ends of the string.
    func trimmed() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
