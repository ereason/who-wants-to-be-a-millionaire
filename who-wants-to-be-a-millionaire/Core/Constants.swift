import Foundation

struct Constant {
    
    private enum Keys: String {
        case username
    }
        
    static var username: String {
        get {
            UserDefaults.standard.string(forKey: Keys.username.rawValue) ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.username.rawValue)
        }
    }
}

