//
//  GuesViewController.swift
//  who-wants-to-be-a-millionaire
//
//  Created by mac on 09.02.2023.
//

import UIKit

class GuestViewController: UIViewController {

    @IBOutlet weak var inputName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func startQuiz(_ sender: Any) {
        let controller = QuizViewController(nibName: "QuizViewController", bundle: nil)
        controller.modalPresentationStyle = .fullScreen
        let username = inputName.text ?? "Guest"
        UserManager.shared.username = username
        controller.quizBrain = MillionareBrain(userName: username)
        controller.navigationItem.hidesBackButton = true
        self.navigationController?.pushViewController(controller, animated: false)
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.navigationController?.popViewController(animated:false)
    }
    
}
