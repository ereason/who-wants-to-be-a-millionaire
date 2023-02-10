//
//  QuestionsViewController.swift
//  who-wants-to-be-a-millionaire
//
//  Created by Админ on 08.02.2023.
//

import UIKit

class QuestionsViewController: UIViewController {
    @IBOutlet weak var B: CustomButton!
    
    @IBOutlet weak var D: CustomButton!
    @IBOutlet weak var C: CustomButton!
    @IBOutlet weak var A: CustomButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        A.setupButton()
    }

    @IBAction func qwe(_ sender: CustomButton) {
        
        sender.setupButton()
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
