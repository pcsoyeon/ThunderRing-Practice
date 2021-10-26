//
//  ViewController.swift
//  Main
//
//  Created by soyeon on 2021/10/18.
//

import UIKit

class MainVC: UIViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet weak var groupListTV: UITableView!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        
        setTableView()
        setNavi()
        getNotification()
    }
}

extension MainVC {
    func initUI() {
        view.backgroundColor = .white
    }
    
    func setTableView() {
        groupListTV.delegate = self
        groupListTV.dataSource = self
        
        let privateNib = UINib(nibName: PrivateTVC.identifier, bundle: nil)
        groupListTV.register(privateNib, forCellReuseIdentifier: PrivateTVC.identifier)
        
        let publicNib = UINib(nibName: PublicTVC.identifier, bundle: nil)
        groupListTV.register(publicNib, forCellReuseIdentifier: PublicTVC.identifier)
    }
    
    func setNavi() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "번개", style: .plain, target: self, action: #selector(touchUpThunder))
    }
    
    func getNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(touchUpCreateThunder(_:)), name: NSNotification.Name("TouchUpCreateThunder"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(touchUpSeeAll(_:)), name: NSNotification.Name("TouchUoSeeAll"), object: nil)
    }
}

extension MainVC {
    @objc
    func touchUpThunder() {
        print("모집 중인 번개")
    }
    
    @objc
    func touchUpCreateThunder(_ notification: Notification) {
        let dvc = CreateThunderVC()
        present(dvc, animated: true, completion: nil)
    }
    
    @objc
    func touchUpSeeAll(_ notification: Notification) {
        let dvc = GroupListVC()
        self.navigationController?.pushViewController(dvc, animated: true)
    }
}

// MARK: - TableView Delegate

extension MainVC: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 150
        } else if indexPath.section == 1 {
            return 400
        } else {
            return 600
        }
    }
}

// MARK: - TableView DataSource

extension MainVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            return UITableViewCell()
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PrivateTVC.identifier) as? PrivateTVC else {
                return UITableViewCell()
            }
            cell.cellDelegate = self
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PublicTVC.identifier) as? PublicTVC else {
                return UITableViewCell()
            }
            return cell
        }
    }
}

extension MainVC: CellDelegate {
    func touchUpSeeAll(dvc: GroupListVC) {
        self.navigationController?.pushViewController(dvc, animated: true)
    }
}
