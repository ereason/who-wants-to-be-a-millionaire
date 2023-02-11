//
//  QuestionsViewController.swift
//  who-wants-to-be-a-millionaire
//
//  Created by Админ on 08.02.2023.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var QuestionNumLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var answerButtons : [UIButton]!
    
    var quizBrain = MillionareBrain()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        UpdateUI()
    }
    
    @IBAction func ButtonPresses(_ sender: UIButton) {
        
        //TODO: блокировка кнопок, чтоб нельзя было спамить
        //answerButtons.forEach({$0.isEnabled = false})
        //answerButtons.forEach({$0.isEnabled = true})
        
        let userAnswer = sender.tag
        let userGotItRight = quizBrain.questionAnswers[userAnswer]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1000), execute: {
            
            if(userGotItRight.isCorrect){
                sender.backgroundColor = UIColor.green
                
            }else {
                sender.backgroundColor = UIColor.red
            }
            
            let controller = RewardsScreenViewController(nibName: "RewardsScreenViewController",
                                                         bundle: nil)
            controller.progress = self.quizBrain.GetQuestionNumber()
            controller.modalPresentationStyle = .fullScreen
            
            self.present(controller, animated: true, completion: nil)
           
            self.quizBrain.NextQuestion()
            self.UpdateUI()
        
        })
   
    }
    
    func UpdateUI() {
        questionLabel.text = quizBrain.GetCurrentQuestion()
        scoreLabel.text = GetScoreLabel
        QuestionNumLabel.text = GetQuestionLabel
        
        answerButtons.forEach({
            $0.setTitle(quizBrain.questionAnswers[$0.tag].answer, for: .normal)
            $0.isEnabled = true
            $0.backgroundColor = UIColor.clear
        })
    }
    
    var GetScoreLabel: String {
        return String(quizBrain.GetScore())+" RUB"
    }
    
    var GetQuestionLabel: String {
        return "Question " + String(quizBrain.GetQuestionNumber() + 1)
    }
}
