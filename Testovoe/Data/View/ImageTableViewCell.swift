//
//  ImageTableViewCell.swift
//  Testovoe
//
//  Created by Лера Тарасенко on 30.01.2021.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    static let reuseId = "ImageTableViewCell"
    
    let picture: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let textMessageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubview(picture)
        picture.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        picture.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        picture.heightAnchor.constraint(equalToConstant: 50).isActive = true
        picture.widthAnchor.constraint(equalToConstant: 50).isActive = true

        addSubview(textMessageLabel)
        textMessageLabel.topAnchor.constraint(equalTo: picture.bottomAnchor).isActive = true
        textMessageLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        textMessageLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        textMessageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
