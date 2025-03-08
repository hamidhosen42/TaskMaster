//
//  UITableViewCell.swift
//  TaskMaster
//
//  Created by Project2Morrow on 8/3/25.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    private let titleLabel = UILabel()
    private let completionSwitch = UISwitch()
    
    var toggleCompletion: (() -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        
        completionSwitch.addTarget(self, action: #selector(switchToggled), for: .valueChanged)
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, completionSwitch])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    func configure(with task: Task) {
        titleLabel.text = task.title
        completionSwitch.isOn = task.isCompleted
    }
    
    @objc private func switchToggled() {
        toggleCompletion?()
    }
}
