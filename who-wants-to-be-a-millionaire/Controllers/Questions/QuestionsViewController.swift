import UIKit
import AVFoundation

class QuestionsViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var QuestionNumLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var answerButtons: [UIButton]!
    @IBOutlet weak var timeIndicaror: UIProgressView!
    
    @IBOutlet weak var halfToHalf: UIButton!
    @IBOutlet weak var viewersHelp: UIButton!
    @IBOutlet weak var callHelp: UIButton!
    
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
     
        if let player = player, !player.isPlaying {
            
            setSound(soundName: "thinking")
            player.currentTime = 0
            player.play()
            startTimer()
            
        }

        UpdateUI()
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
                self.openProgressView(soundName: "rightAnswer", isAnswerCorrect: false)
                
                
            }else {
                self.openProgressView(soundName:"wrongAnswer", isAnswerCorrect: true)
            }
        })
        
    }
    
    func openProgressView(soundName:String, isAnswerCorrect: Bool){
        
        self.setSound(soundName: soundName )
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(3000), execute: {
            
            let controller = RewardsScreenViewController(nibName: "RewardsScreenViewController",bundle: nil)
            controller.quizBrain = self.quizBrain
            controller.isEnd = isAnswerCorrect
            controller.modalPresentationStyle = .fullScreen
            
            controller.navigationItem.hidesBackButton = true
            self.navigationController?.pushViewController(controller, animated: false)

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
            openProgressView(soundName: "wrongAnswer", isAnswerCorrect: true)
            timer.invalidate()
        }
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
    
    
    @IBAction func halfToHalpPressed(_ sender: UIButton) {
        
        
    
        
        halfToHalf.setImage(UIImage(named: "usedHelpFifty.png"), for: .normal)
        quizBrain.helps["fifty"] = true
        halfToHalf.isEnabled = false
    }
    
    
    @IBAction func viewersHelpPressed(_ sender: UIButton) {
        var res = quizBrain.AskHelp()
        
        answerButtons.first(where: {$0.titleLabel?.text == res})?.layer.borderColor = UIColor.red.cgColor
        
        viewersHelp.setImage(UIImage(named: "usedHelpHall.png"), for: .normal)
        quizBrain.helps["view"] = true
        halfToHalf.isEnabled = false
    }
    
    @IBAction func callHelpPressed(_ sender: UIButton) {
        var res = quizBrain.CallHelp()
        
        print(res)
       
        answerButtons.first(where: {$0.titleLabel?.text == res})?.layer.borderColor = UIColor.red.cgColor
    
        
        callHelp.setImage(UIImage(named: "usedHelpCall.png"), for: .normal)
        
        quizBrain.helps["call"] = true
        halfToHalf.isEnabled = false
    }
    
    func blockButtons(status: Bool){
        
        
    }
}
