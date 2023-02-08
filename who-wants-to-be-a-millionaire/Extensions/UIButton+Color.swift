//
//  UIButton+Color.swift
//  who-wants-to-be-a-millionaire
//
//  Created by Alex F on 8.02.23.
//

import UIKit

extension UIButton {
    func answerButton() {  // это для кнопки ответ
       
        let colorStart = UIColor(red: 0.26, green: 0.46, blue: 0.55, alpha: 1).cgColor
        let colorCenter = UIColor(red: 0.125, green: 0.225, blue: 0.375, alpha: 1).cgColor
        let borderColor = UIColor(red: 0.41, green: 0.41, blue: 0.41, alpha: 1).cgColor
 
        let grad = CAGradientLayer()
        grad.colors = [colorStart, colorCenter, colorStart]
        grad.locations = [0.0, 0.5, 1.0]
        grad.cornerRadius = 16
        
        self.tintColor = .white
        self.layer.borderColor = borderColor
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 16
        
        grad.frame = self.bounds
        
        self.layer.addSublayer(grad)
    }
    
}
