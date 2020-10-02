//
//  CardOwnerTableViewCell.swift
//  myGitHubApp
//
//  Created by Gustavo Rodrigues Leitão on 05/08/20.
//  Copyright © 2020 Gustavo. All rights reserved.
//

import UIKit
import SDWebImage

class CardOwnerTableViewCell: UITableViewCell {
    
    private var repositorieLabel   : UILabel!
    private var starLabel          : UILabel!
    private var ownerLabel         : UILabel!
    private var avatarImageView    : UIImageView!
    private var horizontalStackView: UIStackView!
    private var verticalStackView  : UIStackView!
    
    private var repositorie: Repositories?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.prepareLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.prepareLayout()
    }
    
    private func prepareLayout() {
        self.selectionStyle = .none
        
        self.repositorieLabel               = UILabel(frame : .zero)
        self.repositorieLabel.textAlignment = .left
        self.repositorieLabel.font          = UIFont(name: "Ubuntu-Medium", size: 16)
        self.repositorieLabel.numberOfLines = 0
        
        self.starLabel               = UILabel(frame : .zero)
        self.starLabel.textAlignment = .left
        self.starLabel.font          = UIFont(name: "Ubuntu-Regular", size: 14)
        self.starLabel.numberOfLines = 0
        
        self.ownerLabel               = UILabel(frame : .zero)
        self.ownerLabel.textAlignment = .left
        self.ownerLabel.font          = UIFont(name: "Ubuntu-Regular", size: 14)
        self.ownerLabel.numberOfLines = 0
        
        self.avatarImageView                    = UIImageView(frame: .zero)
        self.avatarImageView.layer.cornerRadius = 2
        self.avatarImageView.clipsToBounds      = true
        
        self.horizontalStackView = UIStackView(arrangedSubviews: [avatarImageView, repositorieLabel])
        self.horizontalStackView.distribution = .fill
        self.horizontalStackView.axis         = .horizontal
        self.horizontalStackView.spacing      = 4
        
        self.verticalStackView = UIStackView(arrangedSubviews: [horizontalStackView, ownerLabel, starLabel])
        self.verticalStackView.distribution = .fill
        self.verticalStackView.axis         = .vertical
        self.verticalStackView.spacing      = 8
        
        self.addSubview(verticalStackView)
        
        self.prepareConstraint()
    }
    
    func set(repositorie: Repositories) {
        self.repositorieLabel.text = repositorie.name
        self.starLabel.text  = "Estrelas: \(repositorie.stargazers_count ?? 0)"
        self.ownerLabel.text = repositorie.owner?.login
        
        if let imgUrl = repositorie.owner?.avatar_url, let url = URL(string: imgUrl) {
            self.avatarImageView.sd_setImage(with: url)
        }
    }
    
    private func prepareConstraint() {
        self.avatarImageView.anchor(size: .init(width: 20, height: 20))
        self.verticalStackView.anchor(top: self.topAnchor,
                                      leading: self.leadingAnchor,
                                      bottom: self.bottomAnchor,
                                      trailing: self.trailingAnchor,
                                      padding: .init(top: 16, left: 16, bottom: 16, right: 16))
    }
}
