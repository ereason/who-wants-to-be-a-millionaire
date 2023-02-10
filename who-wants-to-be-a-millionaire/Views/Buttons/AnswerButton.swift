//
//  AnswerButton.swift
//  who-wants-to-be-a-millionaire
//
//  Created by Alex F on 9.02.23.
//

import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        DispatchQueue.main.async {
            self.setupButton()
        }
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    func setupButton() {
        setupShadow()
        styleColor()
        setupLabels()
    }
    
    private func setupLabels() {
        let labelLeft = UILabel()
        labelLeft.text = subtitleLabel?.text
        labelLeft.textColor = .red
        labelLeft.frame = bounds.insetBy(dx: 24, dy: 0)
        labelLeft.textColor = .white
        
        let labelRight = UILabel()
        labelRight.text = titleLabel?.text
        labelRight.textColor = .red
        labelRight.textAlignment = .right
        labelRight.frame = bounds.insetBy(dx: 24, dy: 0)
        labelRight.textColor = .white
        
        addSubview(labelRight)
        addSubview(labelLeft)
        
        titleLabel?.isHidden = true
        subtitleLabel?.isHidden = true
        
    }
    
    private func setupShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 6
        layer.shadowOffset = CGSize(width: 0.0 , height: 6.0)
        clipsToBounds = true
        layer.masksToBounds = false
        
    }
    
    public func styleColor() {
        
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
        print(self.bounds)
        self.layer.addSublayer(grad)
        
    }
    
    func tapEffect() {
        self.alpha = 0.6
        
        UIView.animate(withDuration: 0.3, delay: 0) {
            self.alpha = 1
        }
    }
    
    func setRedBackground() {
        let colorStart = UIColor(red: 0.8, green: 0.5, blue: 0.5, alpha: 1).cgColor
        let colorCenter = UIColor(red: 0.8, green: 0.0, blue: 0.0, alpha: 1).cgColor
        let borderColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1).cgColor
        
        let grad = CAGradientLayer()
        grad.colors = [colorStart, colorCenter, colorStart]
        grad.locations = [0.0, 0.5, 1.0]
        grad.cornerRadius = 16
        
        self.tintColor = .white
        self.layer.borderColor = borderColor
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 16
        
        grad.frame = self.bounds
        
        self.layer.insertSublayer(grad, at: 2)
    }

}
