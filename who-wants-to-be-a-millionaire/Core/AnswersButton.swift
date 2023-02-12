//
//  AnswerButton.swift
//  who-wants-to-be-a-millionaire
//
//  Created by Vladimir Fibe on 2/12/23.
//

import UIKit

class AnswersButton: UIButton {
    private let label = UILabel()
    
    private let icon = UIImageView(image: UIImage(systemName: "bell"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        layoutViews()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addViews()
        layoutViews()
        configureAppearance()
    }
    
    func setTitle(_ title: String?) {
        label.text = title
    }
}

extension AnswersButton {
    func addViews() {
        addSubview(label)
        addSubview(icon)
        label.textAlignment = .right
        label.textColor = .white
        icon.contentMode = .scaleAspectFill
        label.translatesAutoresizingMaskIntoConstraints = false
        icon.translatesAutoresizingMaskIntoConstraints = false
    }
    func layoutViews() {

        NSLayoutConstraint.activate([
            icon.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            icon.widthAnchor.constraint(equalToConstant: 40),
            label.leadingAnchor.constraint(equalToSystemSpacingAfter: icon.trailingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: label.trailingAnchor, multiplier: 1),
            icon.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    func configureAppearance() {

        
//        makeSystem(self)
    }

}

