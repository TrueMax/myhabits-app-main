//
//  HabitDetailsTableViewCell.swift
//  MyHabits_App
//
//  Created by Arthur Raff on 21.11.2020.
//

import UIKit

class HabitDetailsTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    private lazy var dateName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        
        return label
    }()
    
    // MARK: - Configures
    func configure(_ index: Int) {
        dateName.text = HabitsStore.shared.trackDateString(forIndex: index)
    }
    
    // MARK: - Subview Funcs
    private func setupLayout() {
        contentView.addSubviewWithAutoLayout(dateName)
        
        let constraints = [
            dateName.topAnchor.constraint(equalTo: contentView.topAnchor),
            dateName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            dateName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            dateName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupLayout()
    }
}
