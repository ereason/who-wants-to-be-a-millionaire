import Foundation

final class UserManager {
    static let shared = UserManager()
    
    private init (){
        highscores = load()
    }
    
    private enum Keys: String {
        case username
        case score
        case results
    }
    
    var highscores: [UserScore] = []
    
    func addScore(_ value: Int) {
        score = value
        highscores.append(UserScore(name: username, score: value, date: Date()))
        highscores = highscores.sorted(by: { $0.score > $1.score})
        save()
    }
    

    func save() {
        let data = highscores.map { try? JSONEncoder().encode($0)}
        UserDefaults.standard.set(data, forKey: Keys.results.rawValue)
    }
    
    func load() -> [UserScore] {
        if let encodedData = UserDefaults.standard.array(forKey: Keys.results.rawValue) as? [Data] {
            return encodedData.map { try! JSONDecoder().decode(UserScore.self, from: $0)}
        } else {
            return []
        }
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
