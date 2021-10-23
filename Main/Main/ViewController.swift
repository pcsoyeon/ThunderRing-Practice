//
//  ViewController.swift
//  Main
//
//  Created by soyeon on 2021/10/18.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet weak var groupListTV: UITableView!
    @IBOutlet weak var topView: UIView!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        setTableView()
        
        NotificationCenter.default.addObserver(self, selector: #selector(touchUpSeeAll(_:)), name: NSNotification.Name("touchUpSeeAll"), object: nil)
    }
    
    @objc
    func touchUpSeeAll(_ notification: Notification) {
        
    }
}

extension ViewController {
    func initUI() {
        view.backgroundColor = .white
        
        topView.backgroundColor = .systemPurple
        topView.layer.cornerRadius = 10
        topView.layer.masksToBounds = true
    }
    
    func setTableView() {
        groupListTV.delegate = self
        groupListTV.dataSource = self
        
        let privateNib = UINib(nibName: PrivateTVC.identifier, bundle: nil)
        groupListTV.register(privateNib, forCellReuseIdentifier: PrivateTVC.identifier)
        
        let publicNib = UINib(nibName: PublicTVC.identifier, bundle: nil)
        groupListTV.register(publicNib, forCellReuseIdentifier: PublicTVC.identifier)
    }
}

extension ViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 400
        } else {
            return 600
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PrivateTVC.identifier) as? PrivateTVC else {
                return UITableViewCell()
            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PublicTVC.identifier) as? PublicTVC else {
                return UITableViewCell()
            }
            return cell
        }
    }
}


