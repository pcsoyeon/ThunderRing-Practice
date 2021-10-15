//
//  ViewController.swift
//  PushNotification
//
//  Created by soyeon on 2021/10/16.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet weak var listTableView: UITableView!
    
    // MARK: - Properties
    
    var appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    let groupNames = ["양파링걸즈",
                         "무한적아",
                         "한남더힐"]

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
    }
}

extension ViewController {
    func setTableView() {
        listTableView.delegate = self
        listTableView.dataSource = self
        
        let nib = UINib(nibName: ListTVC.identifier, bundle: nil)
        listTableView.register(nib, forCellReuseIdentifier: ListTVC.identifier)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let groupName = groupNames[indexPath.row]
        
        let alert = UIAlertController(title: "",
                                      message: groupName + "에게 번개를 보낼까요?",
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.appDelegate?.scheduleNotification(groupName: groupName)
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTVC.identifier) as? ListTVC else { return UITableViewCell() }
        cell.initCell(name: groupNames[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
}
