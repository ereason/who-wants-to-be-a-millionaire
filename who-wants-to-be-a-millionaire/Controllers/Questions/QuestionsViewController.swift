import UIKit
import AVFoundation

class QuestionsViewController: UIViewController {
    var player: AVAudioPlayer?
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var QuestionNumLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var answerButtons : [UIButton]!
    
    var quizBrain = MillionareBrain()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        UpdateUI()
        player?.numberOfLoops = -1
        playSound()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let player = player, !player.isPlaying {
            player.play()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let player = player {
            player.stop()
        }
    }
    @IBAction func ButtonPresses(_ sender: UIButton) {
        
        //TODO: блокировка кнопок, чтоб нельзя было спамить
        //answerButtons.forEach({$0.isEnabled = false})
        //answerButtons.forEach({$0.isEnabled = true})
        
        let userAnswer = sender.tag
        let userGotItRight = quizBrain.questionAnswers[userAnswer]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1000), execute: {
            
            if(userGotItRight.isCorrect){
                
                let controller = RewardsScreenViewController(nibName: "RewardsScreenViewController",
                                                             bundle: nil)
                controller.progress = self.quizBrain.GetQuestionNumber()
                controller.isTrue = true
                controller.modalPresentationStyle = .fullScreen
                self.present(controller, animated: true, completion: nil)
                self.quizBrain.NextQuestion()
                
            }else {
                sender.backgroundColor = UIColor.red
            }
            
        
          
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
    
    func playSound() {
        guard let path = Bundle.main.path(forResource: "thinking", ofType:"mp3") else {
            return }
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
