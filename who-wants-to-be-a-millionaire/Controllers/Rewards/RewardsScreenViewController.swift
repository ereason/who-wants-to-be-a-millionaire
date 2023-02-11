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
    @IBOutlet var backgroundImages: [UIImageView]!
    
    var progress: Int = 0
    var isTrue: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @IBAction func goNext(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func getMoney(_ sender: Any) {
    }
    
    func setupView() {
        if progress == 0 {
            changeBackground(index: 0, isRight: isTrue) // Если это первый вопрос
        }
        else {
            for i in 0...(progress - 1) {
                changeBackground(index: i, isRight: true) // Окраска предыдущих вопросов в зеленый
            }
            changeBackground(index: progress, isRight: isTrue)
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
