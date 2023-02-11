//
//  RewardsScreenViewController.swift
//  who-wants-to-be-a-millionaire
//
//  Created by Герман Кунин on 06.02.2023.
//

import UIKit
import AVFAudio

class ProgressViewController: UIViewController {
    
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var endButton: UIButton!
    @IBOutlet var backgroundImages: [UIImageView]!
    
    var quizBrain: MillionareBrain!
    
    var isEnd: Bool!
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        continueButton.isEnabled = !isEnd
        playSound(soundName: "bg2")
        setupView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let player = player {
            player.stop()
        }
    }
    
    @IBAction func goNext(_ sender: Any) {
        print(quizBrain.getQuestionNumber())
        quizBrain.goToNextQuestion()
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func getMoney(_ sender: Any) {
        let controller = LoseViewController(nibName: "LoseViewController", bundle: nil)
        controller.modalPresentationStyle = .fullScreen
        controller.navigationItem.hidesBackButton = true
        controller.quizBrain = self.quizBrain
        self.navigationController?.pushViewController(controller, animated: false)
        //present(controller, animated: true)
        
    }
    
    func playSound(soundName:String) {
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
    
    func setupView() {
        if quizBrain.getQuestionNumber() == 0 {
            changeBackground(index: 0, isRight: !isEnd) // Если это первый вопрос
        }
        else {
            for i in 0...(quizBrain.getQuestionNumber() - 1) {
                changeBackground(index: i, isRight: true) // Окраска предыдущих вопросов в зеленый
            }
            changeBackground(index: quizBrain.getQuestionNumber(), isRight: !isEnd)
        }
    }
    
    func changeBackground(index: Int, isRight: Bool) {
        if isRight {
            if [4, 9, 14].contains(index) {
                backgroundImages[index].image = UIImage(named: "Rectangle yellow")
                return
            }
            backgroundImages[index].image = UIImage(named: "Rectangle green")
        }
        else {
            backgroundImages[index].image = UIImage(named: "Rectangle red")
        }
    }
}
