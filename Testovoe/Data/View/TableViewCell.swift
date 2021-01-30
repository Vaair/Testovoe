//
//  TableViewCell.swift
//  Testovoe
//
//  Created by Лера Тарасенко on 29.01.2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    static let reuseId = "TableViewCell"
    
    let textMessageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(textMessageLabel)
        textMessageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        textMessageLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        textMessageLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        textMessageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
