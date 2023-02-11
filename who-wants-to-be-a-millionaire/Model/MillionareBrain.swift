import Foundation

class MillionareBrain {
  
    private var userName: String
    private var questions: [Question]
    private var questionAnswers: [(answer: String, isCorrect: Bool)]
    var helps: [String : Bool] = [
        "fifty": false,
        "call": false,
        "view": false]
    
    private var questionNumber: Int
    private var score: Int
    private let costsOfQuestions: [Int] = [
        100,
        200,
        300,
        500,
        1000,
        2000,
        4000,
        8000,
        16000,
        32000,
        64000,
        125_000,
        250_000,
        500_000,
        1_000_000
    ]
    
    public init(userName:String) {
        self.userName=userName
        score = 0
        questions = Question.getQuestions()
        questionNumber = 0
        questionAnswers = []
        self.randomizeAnswers()
    }
    
    
    func getScore() -> Int {
        return score
    }
    
    func getQuestionNumber() -> Int {
        return questionNumber
    }
    
    func getCurrentQuestion() -> String {
        return questions[questionNumber].ask
    }
    
    func getQuestionAnswers() -> [(answer: String, isCorrect: Bool)] {
        return questionAnswers
    }
    
    func getUsername() -> String {
        return userName
    }
    
    private func randomizeAnswers() {
        questionAnswers.removeAll()
        questions[questionNumber].wrongAnswers.forEach { str in
            questionAnswers.append((str, false))
        }
        questionAnswers.append((questions[questionNumber].correctAnswer, true))
        questionAnswers.shuffle()
    }
    
    func goToNextQuestion() {
        score += costsOfQuestions[questionNumber]
        
        if questionNumber < questions.count - 1 {
            questionNumber += 1
            self.randomizeAnswers()
        }
    }
    
    func callHelp() -> String {
        return getCorrectAnswerWithChanse(percent: 80)
    }
    
    func askHelp() -> String {
        return getCorrectAnswerWithChanse(percent: 50)
    }
    
    func getCorrectAnswerWithChanse(percent: Int) -> String {
        if (Int.random(in: 1...100) < percent) {
            return questions[questionNumber].correctAnswer
            //questionAnswers.first(where: {$0.isCorrect})!.answer
        } else {
            return questions[questionNumber].wrongAnswers.randomElement() ?? ""
            //questionAnswers.filter{!$0.isCorrect}.randomElement()!.answer
        }
    }
}
