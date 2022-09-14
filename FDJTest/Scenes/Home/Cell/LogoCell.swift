//
//  LogoCell.swift
//  FDJTest
//
//  Created by Mathias Erligmann on 14/09/2022.
//

import UIKit
import SDWebImage

class LogoCell: UICollectionViewCell {
    
    private let logoImageView = UIImageView()
    
    class var cellIdentifier: String {
        return "LogoCell"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLogoImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Set
    
    func set(team: Team) {
        if let logoUrl = team.strTeamBadge {
            logoImageView.sd_setImage(with: URL(string: logoUrl))
        }
    }
    
    // MARK: Configure
    
    private func configureLogoImageView() {
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(logoImageView)
        logoImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        logoImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        logoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
    }
}
