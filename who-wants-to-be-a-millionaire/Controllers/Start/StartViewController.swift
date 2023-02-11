//
//  StartViewController.swift
//  who-wants-to-be-a-millionaire
//
//  Created by Админ on 07.02.2023.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func rulesButtomTapped(_ sender: UIButton) {
        let controller = LoseViewController(nibName: "LoseViewController", bundle: nil)
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true)
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        let controller = QuestionsViewController(nibName: "QuestionsViewController", bundle: nil)
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true, completion: nil)
    }
    
}


