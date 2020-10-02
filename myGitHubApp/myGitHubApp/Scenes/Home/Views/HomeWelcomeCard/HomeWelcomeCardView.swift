//
//  HomeWelcomeCardView.swift
//  myGitHubApp
//
//  Created by Gustavo Rodrigues Leitão on 04/08/20.
//  Copyright © 2020 Gustavo. All rights reserved.
//

import UIKit

private enum Constants {
    static let titleText        = "Criado para desenvolvedores"
    static let descriptionLabel = "O GitHub é uma plataforma de desenvolvimento inspirada na maneira como você trabalha. Do código aberto aos negócios, você pode hospedar e revisar códigos, gerenciar projetos e criar software junto a 50 milhões de desenvolvedores."
}

class HomeWelcomeCardView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let lbl           = UILabel()
        lbl.textAlignment = .left
        lbl.font          = UIFont(name: "Ubuntu-Medium", size: 16)
        lbl.numberOfLines = 0
        lbl.text          = Constants.titleText
        return lbl
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let lbl           = UILabel()
        lbl.textAlignment = .left
        lbl.font          = UIFont(name: "Ubuntu-Light", size: 14)
        lbl.numberOfLines = 0
        lbl.text          = Constants.descriptionLabel
        return lbl
    }()
    
    init() {
        super.init(frame: .zero)
        self.prepareLayout()
    }
    
    override init(frame: CGRect) {
      super.init(frame: frame)
      self.prepareLayout()
    }

    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.prepareLayout()
    }
    
    private func prepareLayout() {
        self.makeACard()

        self.addSubview(titleLabel)
        self.addSubview(descriptionLabel)
        
        self.prepareConstraint()
    }
    
    private func prepareConstraint() {
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 24).isActive = true
        self.titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        self.titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        
        self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        self.descriptionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        self.descriptionLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        self.descriptionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
    }
}
