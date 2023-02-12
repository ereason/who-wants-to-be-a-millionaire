import Foundation

final class UserManager {
    static let shared = UserManager()
    
    private init (){}
    
    private enum Keys: String {
        case username
        case score
    }
        
    var username: String {
        get {
            UserDefaults.standard.string(forKey: Keys.username.rawValue) ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.username.rawValue)
        }
    }
    
    var score: Int {
        get {
            UserDefaults.standard.integer(forKey: Keys.score.rawValue)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.score.rawValue)
        }
    }
}
