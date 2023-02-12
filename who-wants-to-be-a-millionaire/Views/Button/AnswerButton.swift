//
//  AnswerButton.swift
//  who-wants-to-be-a-millionaire
//
//  Created by Alex F on 9.02.23.
//

import UIKit

class AnswerButton: UIButton {
    var labelLeft = UILabel()
    var labelRight = UILabel()
    
    let colors = Colors()
   
    let blueLayer = CAGradientLayer()
    let redLayer = CAGradientLayer()
    let greenLayer = CAGradientLayer()
    let yellowLayer = CAGradientLayer()



    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    func setupButton() {
        setupShadow()
        setupLabels()
        setupLayers()
    }
    
  func  setupLayers() {
      addGradientLayer(grLayer: blueLayer, with: colors.blueGr, position: 1)
      addGradientLayer(grLayer: yellowLayer, with: colors.yellowGr, position: 2)
      addGradientLayer(grLayer: greenLayer, with: colors.greenGr, position: 3)
      addGradientLayer(grLayer: redLayer, with: colors.redGr, position: 4)
      
      greenLayer.isHidden = true
      redLayer.isHidden = true
      yellowLayer.isHidden = true


    }
    
    private func setupLabels() {
        labelLeft.text = subtitleLabel?.text
        labelLeft.textColor = .red
        labelLeft.frame = bounds.insetBy(dx: 24, dy: 0)
        labelLeft.textColor = .white
        
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

    func tapEffect() {
        self.alpha = 0.6
        
        UIView.animate(withDuration: 0.3, delay: 0) {
            self.alpha = 1
        }
    }
    
    
    private func addGradientLayer(grLayer: CAGradientLayer, with grColors: [CGColor], position idx: UInt32) {
        
        grLayer.colors = grColors
        grLayer.locations = [0.0, 0.5, 1.0]
        grLayer.cornerRadius = 16
        
        self.tintColor = .white
        self.layer.borderColor = colors.borderButtonColor
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 16
        
        grLayer.frame = self.bounds
        
        self.layer.insertSublayer(grLayer, at: idx)
    }

}
