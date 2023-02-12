//
//  LeaderBoardTableViewCell.swift
//  who-wants-to-be-a-millionaire
//
//  Created by Vladimir Fibe on 2/12/23.
//

import UIKit

class LeaderBoardTableViewCell: UITableViewCell {

    let dateLabel: UILabel = {
        $0.text = "12.02"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 18)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.widthAnchor.constraint(equalToConstant: 80).isActive = true
        $0.textAlignment = .left
        return $0
    }(UILabel())
    
    let nameLabel: UILabel = {
        $0.text = "12.02"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 18)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .left
        return $0
    }(UILabel())
    
    let scoreLabel: UILabel = {
        $0.text = "12.02"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 18)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.widthAnchor.constraint(equalToConstant: 80).isActive = true
        $0.textAlignment = .right
        return $0
    }(UILabel())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with score: UserScore) {
        scoreLabel.text = "\(score.score)"
        nameLabel.text = score.name
        
        let formatter = DateFormatter()
        formatter.dateFormat = "d.MM"
        dateLabel.text = formatter.string(from: score.date)
    }
    
    func setupUI() {
        contentView.addSubview(dateLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(scoreLabel)
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 1),
            dateLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 1),
            contentView.bottomAnchor.constraint(equalToSystemSpacingBelow: dateLabel.bottomAnchor, multiplier: 1),
            nameLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: dateLabel.trailingAnchor, multiplier: 1),
            nameLabel.centerYAnchor.constraint(equalTo: dateLabel.centerYAnchor),
            scoreLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: nameLabel.trailingAnchor, multiplier: 1),
            scoreLabel.centerYAnchor.constraint(equalTo: dateLabel.centerYAnchor),
            contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: scoreLabel.trailingAnchor, multiplier: 1)
        ])
    }
}
