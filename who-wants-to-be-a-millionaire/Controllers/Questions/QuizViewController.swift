import UIKit
import AVFoundation

class QuizViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var QuestionNumLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var answerButtons: [UIButton]!
    @IBOutlet weak var timeIndicaror: UIProgressView!
    
    @IBOutlet weak var halfToHalf: UIButton!
    @IBOutlet weak var viewersHelp: UIButton!
    @IBOutlet weak var callHelp: UIButton!
    
    var player: AVAudioPlayer?
    var quizBrain: MillionareBrain!
    var timer = Timer()
    var totalTime = 30
    var secondsPassed = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
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
        updateUI()
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
        blockStatusHelpBt(status: false)
        
        let userAnswer = Int(sender.tag)
        let userGotItRight = quizBrain.getQuestionAnswers()[userAnswer]?.isCorrect
        
        timer.invalidate()
        self.setSound(soundName: "waiting")
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(3000), execute: { [self] in
            
            self.player?.stop()
            
            if (userGotItRight!) {
                self.openProgressView(soundName: "rightAnswer", isAnswerCorrect: false)
            } else {
                self.openProgressView(soundName:"wrongAnswer", isAnswerCorrect: true)
            }
        })
        
    }
    
    func openProgressView(soundName:String, isAnswerCorrect: Bool){
        self.setSound(soundName: soundName )
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(3000), execute: {
            
            let controller = ProgressViewController(nibName: "ProgressViewController",bundle: nil)
            controller.quizBrain = self.quizBrain
            controller.isEnd = isAnswerCorrect
            controller.modalPresentationStyle = .fullScreen
            
            controller.navigationItem.hidesBackButton = true
            self.navigationController?.pushViewController(controller, animated: false)

            self.updateUI()
        })
    }
    
    
    func updateUI() {
        questionLabel.text = quizBrain.getCurrentQuestion()
        scoreLabel.text = getScoreLabel
        QuestionNumLabel.text = getQuestionLabel
        
        updateStatusHelpBt()
        
        answerButtons.forEach({
            $0.setTitle(quizBrain.getQuestionAnswers()[Int($0.tag)]?.answer, for: .normal)
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
    
    
    var getScoreLabel: String {
        return String(quizBrain.getScore())+" RUB"
    }
    
    var getQuestionLabel: String {
        return "Question " + String(quizBrain.getQuestionNumber() + 1)
    }
    
    func setSound(soundName: String) {
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
    
        //quizBrain.
        
        
        sender.setBackgroundImage(UIImage(named: "usedHelpFifty.png"), for: .normal)
        quizBrain.helps["fifty"] = false
        halfToHalf.isEnabled = false
    }
    
    
    @IBAction func viewersHelpPressed(_ sender: UIButton) {
        var res = quizBrain.askHelp()
        
        //заменить на хайлайт
        answerButtons[res].isEnabled = false
        
        sender.setBackgroundImage(UIImage(named: "usedHelpHall.png"), for: .normal)
        quizBrain.helps["view"] = false
        viewersHelp.isEnabled = false
    }
    
    @IBAction func callHelpPressed(_ sender: UIButton) {
        var res = quizBrain.callHelp()
    
        //заменить на хайлайт
        answerButtons[res].isEnabled = false
    
        sender.setBackgroundImage(UIImage(named: "usedHelpCall.png"), for: .normal)
        quizBrain.helps["call"] = false
        callHelp.isEnabled = false
    }
    
    func updateStatusHelpBt() {
        callHelp.isEnabled = quizBrain.helps["call"]!
        viewersHelp.isEnabled = quizBrain.helps["view"]!
        halfToHalf.isEnabled = quizBrain.helps["fifty"]!
    }
    
    func blockStatusHelpBt(status: Bool) {
        callHelp.isEnabled = status
        viewersHelp.isEnabled = status
        halfToHalf.isEnabled = status
    }
}
