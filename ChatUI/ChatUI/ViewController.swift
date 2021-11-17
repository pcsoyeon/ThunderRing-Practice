//
//  ViewController.swift
//  ChatUI
//
//  Created by soyeon on 2021/11/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var chatListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chatListTableView.delegate = self
        chatListTableView.dataSource = self
        
        let nib = UINib(nibName: ListTVC.identifier, bundle: nil)
        chatListTableView.register(nib, forCellReuseIdentifier: ListTVC.identifier)
        
        chatListTableView.separatorStyle = .none
    }

}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let dvc = UIStoryboard(name: "Chat", bundle: nil).instantiateViewController(withIdentifier: "ChatVC") as? ChatVC else { return }
        self.navigationController?.pushViewController(dvc, animated: true)
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTVC.identifier) as? ListTVC else { return UITableViewCell() }
        cell.selectionStyle = .none
        return cell
    }
}
