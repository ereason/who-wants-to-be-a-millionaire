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
        let controller = RulesViewController(nibName: "RulesViewController", bundle: nil)
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true)
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        let controller = GuesViewController(nibName: "GuesViewController", bundle: nil)
        controller.modalPresentationStyle = .fullScreen
        controller.navigationItem.hidesBackButton = true
        self.navigationController?.pushViewController(controller, animated: false)
       // self.present(controller, animated: true, completion: nil)
    }
    
}


