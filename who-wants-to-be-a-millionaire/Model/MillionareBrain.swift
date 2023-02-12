import Foundation

class MillionareBrain {
  
    private var userName: String
    private var questions: [Question]
    private var questionAnswers: [Int:(answer: String, isCorrect: Bool)]
    var helps: [String : Bool] = [
        "fifty": true,
        "call": true,
        "view": true]
    
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
        questionAnswers = [:]
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
    
    func getQuestionAnswers() -> [Int:(answer: String, isCorrect: Bool)] {
        return questionAnswers
    }
    
    func getUsername() -> String {
        return userName
    }
    
    private func randomizeAnswers() {
       
        var buff: [(answer: String, isCorrect: Bool)] = []
        
        questions[questionNumber].wrongAnswers.forEach { str in
            buff.append((str, false))
        }
        buff.append((questions[questionNumber].correctAnswer, true))
       
        buff.shuffle()
        
        
        for i in 0..<buff.count{
    
            questionAnswers[i] = buff[i]
        }
    
    }
    
    func goToNextQuestion() {
        score += costsOfQuestions[questionNumber]
        
        if questionNumber < questions.count - 1 {
            questionNumber += 1
            self.randomizeAnswers()
        }
    }
    
    func fiftyHelp(){
//questionAnswers.filter({!$0.value.isCorrect})
    }
    
    func callHelp() -> Int {
        return getCorrectAnswerWithChanse(percent: 80)
    }
    
    func askHelp() -> Int {
        return getCorrectAnswerWithChanse(percent: 50)
    }
    
    func getCorrectAnswerWithChanse(percent: Int) -> Int {
        if (Int.random(in: 1...100) < percent) {
            return questionAnswers.first(where: {$0.value.isCorrect})!.key
        } else {
            return questionAnswers.filter({!$0.value.isCorrect}).randomElement()!.key
        }
    }
}
