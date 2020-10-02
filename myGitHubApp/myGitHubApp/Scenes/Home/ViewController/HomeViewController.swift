//
//  HomeViewController.swift
//  myGitHubApp
//
//  Created by Gustavo Rodrigues Leitão on 04/08/20.
//  Copyright © 2020 Gustavo. All rights reserved.
//

import UIKit

class HomeViewController: LinearLayoutViewController {
    
    private var homeWelcomeCardView: HomeWelcomeCardView!
    private var repositoriesView   : RepositoriesView!
    
    private var presenter: HomePresenter = HomePresenter()
    
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .left
        lbl.font = UIFont(name: "Ubuntu-Bold", size: 16)
        lbl.numberOfLines = 0
        lbl.text = "Bem vindo aos melhores repositórios"
        return lbl
    }()
    
    override init() {
        super.init()
        super.offset = UIEdgeInsets(top: 24, left: 16, bottom: 34, right: -16)
        super.spacing = 16
        super.allowPullToRefresh = true
        self.color    = #colorLiteral(red: 0.9490196078, green: 0.9568627451, blue: 0.9725490196, alpha: 1)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getRepositories()
        self.navigationItem.title = "MyGitHub"
    }
    
    private func prepareLayout() {
        self.add(view: titleLabel)
        
        self.scrollView.delegate = self
    
        self.homeWelcomeCardView = HomeWelcomeCardView()
        self.add(view: homeWelcomeCardView)
        
        self.repositoriesView = RepositoriesView(repositories: presenter.response)
        self.add(view: repositoriesView)
    }
    
    private func getRepositories() {
        AppLoading.show()
        self.presenter.getRespositories(completion: getRepositoryHandler(), failure: getRepositoryFailure())
    }
    
    private func getRepositoryHandler()-> SuccessHandler {
        return {
            AppLoading.stop()
            self.prepareLayout()
        }
    }
    
    private func updateRepositoryHandler()-> SuccessHandler {
        return {
            self.refreshControl.endRefreshing()
        }
    }
    
    private func getRepositoryFailure()-> FailureHandler {
        return { error in
            self.refreshControl.endRefreshing()
            AppLoading.stop()
        }
    }
    
    override func didPullToRefresh() {
        super.didPullToRefresh()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.presenter.getRespositories(completion: self.updateRepositoryHandler(), failure: self.getRepositoryFailure())
        }
    }
}

extension HomeViewController: UIScrollViewDelegate {

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY       = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height

        if offsetY > contentHeight - scrollView.frame.size.height * 4 {
            self.presenter.getRespositories(completion: self.updateRepositoryHandler(), failure: self.getRepositoryFailure())
            self.repositoriesView.repositories = presenter.response
            self.repositoriesView.tableViewReloadData()
        }
    }
}
