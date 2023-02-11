import UIKit
import AVFoundation

class QuestionsViewController: UIViewController {
 
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var QuestionNumLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var answerButtons : [UIButton]!
    
    @IBOutlet weak var timeIndicaror: UIProgressView!
    
    var player: AVAudioPlayer?
    var quizBrain:MillionareBrain!
    var timer = Timer()
    var totalTime = 30
    var secondsPassed = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        UpdateUI()
        player?.numberOfLoops = -1
        setSound(soundName: "thinking")
        player?.play()
        startTimer()
        print(quizBrain.userName.count)
    }
    
    func startTimer(){
        
        timeIndicaror.progress = 0.0
               secondsPassed = 0
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
    }
   
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            timeIndicaror.progress = Float(secondsPassed) / Float(totalTime)
            print(Float(secondsPassed) / Float(totalTime))
        } else {
            answerButtons.forEach({$0.isEnabled = false})
            qwe(names: "wrongAnswer", isCorrecr: true)
            timer.invalidate()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let player = player, !player.isPlaying {
            
            setSound(soundName: "thinking")
            player.currentTime = 0
            player.play()
            startTimer()
            
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let player = player {
        
            player.stop()
            timer.invalidate()
        }
    }
    @IBAction func ButtonPresses(_ sender: UIButton) {
        
       
        answerButtons.forEach({$0.isEnabled = false})
    
        
        let userAnswer = sender.tag
        let userGotItRight = quizBrain.questionAnswers[userAnswer]
        
        timer.invalidate()
        self.setSound(soundName: "waiting")
    
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(3000), execute: { [self] in
          
            self.player?.stop()
            
                if(userGotItRight.isCorrect){
                    self.qwe(names: "rightAnswer", isCorrecr: false)
                  
                    
                }else {
                    self.qwe(names:"wrongAnswer",isCorrecr: true)
                }
        })
       
    }
    
    func qwe(names:String,isCorrecr: Bool){
        self.setSound(soundName: names )
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(3000), execute: {
            
            let controller = RewardsScreenViewController(nibName: "RewardsScreenViewController",bundle: nil)
            controller.quizBrain = self.quizBrain
            controller.isEnd = isCorrecr
            controller.modalPresentationStyle = .fullScreen
          
            controller.navigationItem.hidesBackButton = true
            self.navigationController?.pushViewController(controller, animated: false)
           //self.present(controller, animated: true, completion: nil)
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
    
    func setSound(soundName:String) {
        guard let path = Bundle.main.path(forResource: soundName, ofType:"mp3") else {
            return
            
        }
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
