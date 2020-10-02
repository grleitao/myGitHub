//
//  RepositoriesView.swift
//  myGitHubApp
//
//  Created by Gustavo Rodrigues Leitão on 05/08/20.
//  Copyright © 2020 Gustavo. All rights reserved.
//

import UIKit

class RepositoriesView: UIView {
    
    private var tableView: UITableView = UITableView()
    
    var repositories: [Repositories] = []
                
    private var observable : NSKeyValueObservation? = nil

    init(repositories: [Repositories] = []) {
        self.repositories = repositories
        super.init(frame: .zero)
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
        
        self.tableView.dataSource = self
        self.tableView.delegate   = self
        self.tableView.isScrollEnabled = false
        self.addSubview(tableView)

        self.prepareConstraint()
        self.tableViewReloadData()
    }
    
    func tableViewReloadData() {
        self.tableView.reloadData()
        self.observable = tableView.observe(\.contentSize, options: .new, changeHandler: { (tableView, value) in
            if let newValue = value.newValue {
                self.tableView.addHeightConstaintOrUpdate(constant: newValue.height)
            }
        })
    }
    
    deinit {
        self.observable = nil
    }
    
    private func prepareConstraint() {
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}

extension RepositoriesView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CardOwnerTableViewCell()
        cell.set(repositorie: repositories[indexPath.item])
        return cell
    }
}
