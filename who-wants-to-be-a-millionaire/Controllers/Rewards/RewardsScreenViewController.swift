//
//  RewardsScreenViewController.swift
//  who-wants-to-be-a-millionaire
//
//  Created by Герман Кунин on 06.02.2023.
//

import UIKit
import AVFAudio

class RewardsScreenViewController: UIViewController {

    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var endButton: UIButton!
    
    var quizBrain:MillionareBrain!
    
    var isEnd: Bool!
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
            continueButton.isEnabled = !isEnd
        
        playSound(soundName: "bg2")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let player = player {
            player.stop()

        }
    }

    @IBAction func goNext(_ sender: Any) {
        print(quizBrain.GetQuestionNumber())
        self.dismiss(animated: true)
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
}
