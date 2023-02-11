import Foundation

class MillionareBrain {
  
    var questions:[Question]
   
    //TODO убать паблик
    public var questionAnswers:[(answer:String,isCorrect:Bool)]
    ///
    
    private var questionNumber:Int
    private var score:Int
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
    
    public init(){
        score = 0
        questions = Question.questions()
        questionNumber = 0
        questionAnswers = []
        self.randomizeAnswers()
    }
    
    
    func GetScore() -> Int {
        return score
    }
    
    func GetQuestionNumber() -> Int {
        return questionNumber
    }
    
    func GetCurrentQuestion()->String {
        return questions[questionNumber].ask
    }
    
    private func randomizeAnswers(){
        questionAnswers.removeAll()
        questions[questionNumber].wrongAnswers.forEach { str in
            questionAnswers.append((str,false))
        }
        questionAnswers.append((questions[questionNumber].correctAnswer,true))
        questionAnswers.shuffle()
    }
    
    func NextQuestion() {
        score += costsOfQuestions[questionNumber]
        
        if questionNumber < questions.count - 1 {
            questionNumber += 1
            self.randomizeAnswers()
        }
    }
    
    func CallHelp()->String{
        return GetCorrectAnswerWithChanse(percent: 80)
    }
    
    func AskHelp()->String{
        return GetCorrectAnswerWithChanse(percent: 50)
    }
    
    func GetCorrectAnswerWithChanse(percent: Int)->String{
        if(Int.random(in: 1...100) < percent){
            
            return questions[questionNumber].correctAnswer
            //questionAnswers.first(where: {$0.isCorrect})!.answer
        }else{
            return  questions[questionNumber].wrongAnswers.randomElement() ?? ""
            //questionAnswers.filter{!$0.isCorrect}.randomElement()!.answer
        }
    }
}
