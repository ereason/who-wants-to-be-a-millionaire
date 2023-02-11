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

        // Do any additional setup after loading the view.
    }

    @IBAction func startQuiz(_ sender: Any) {
        let controller = QuestionsViewController(nibName: "QuestionsViewController", bundle: nil)
        controller.modalPresentationStyle = .fullScreen
        
        controller.quizBrain = MillionareBrain(userName: inputName.text ?? "Guest")
        controller.navigationItem.hidesBackButton = true
        self.navigationController?.pushViewController(controller, animated: false)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
