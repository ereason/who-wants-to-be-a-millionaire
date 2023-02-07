import Foundation

struct MillionareBrain {
    var questions = Question.questions()

    // помощь зала
    
    // помощь друга
    
    private var score = 0
    private var questionNumber = 0
    
    var currentQuestion: String {
        questions[questionNumber].ask
    }
    
    var currentProgress: Float {
        questions.isEmpty ? 1 : (Float(questionNumber + 1)) / Float(questions.count)
    }
    
    var currentScore: Int {
        score
    }
    
    var currentAnswers: [String] {
        var result = questions[questionNumber].wrongAnswers
        result.append(questions[questionNumber].correctAnswer)
        return result.shuffled()
    }
    
    mutating func checkAnswer(_ answer: String) -> Bool {
        if questions[questionNumber].correctAnswer == answer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    mutating func nextQuestion() {
        if questionNumber < questions.count - 1 {
            questionNumber += 1
        }
    }
    
    mutating func reset() {
        score = 0
        questionNumber = 0
    }
}
