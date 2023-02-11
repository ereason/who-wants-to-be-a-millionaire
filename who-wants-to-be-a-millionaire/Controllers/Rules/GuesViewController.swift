//
//  GuesViewController.swift
//  who-wants-to-be-a-millionaire
//
//  Created by mac on 09.02.2023.
//

import UIKit

class GuesViewController: UIViewController {

    @IBOutlet weak var inputName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func startQuiz(_ sender: Any) {
        let controller = QuestionsViewController(nibName: "QuestionsViewController", bundle: nil)
        controller.modalPresentationStyle = .fullScreen
        
        controller.quizBrain = MillionareBrain(userName: inputName.text ?? "Guest")
        controller.navigationItem.hidesBackButton = true
        self.navigationController?.pushViewController(controller, animated: false)
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.navigationController?.popViewController(animated:false)
    }
    
}
