//
//  ViewController.swift
//  Main
//
//  Created by soyeon on 2021/10/18.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var groupListTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        setTableView()
    }
}

extension ViewController {
    func initUI() {
        title = "썬더링"
        view.backgroundColor = .white
    }
    
    func setTableView() {
        groupListTV.delegate = self
        groupListTV.dataSource = self
        
        let nib = UINib(nibName: PrivateTVC.identifier, bundle: nil)
        groupListTV.register(nib, forCellReuseIdentifier: PrivateTVC.identifier)
    }
}

extension ViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

