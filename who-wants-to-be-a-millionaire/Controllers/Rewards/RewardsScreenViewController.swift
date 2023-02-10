//
//  RewardsScreenViewController.swift
//  who-wants-to-be-a-millionaire
//
//  Created by Герман Кунин on 06.02.2023.
//

import UIKit

class RewardsScreenViewController: UIViewController {

    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var endButton: UIButton!
    
    var progress:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func goNext(_ sender: Any) {
        print(progress)
        self.dismiss(animated: true)
    }
    
    @IBAction func getMoney(_ sender: Any) {
    }

}
