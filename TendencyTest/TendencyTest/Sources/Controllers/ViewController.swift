//
//  ViewController.swift
//  TendencyTest
//
//  Created by soyeon on 2021/12/26.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI
    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    private var currentIndex: Int = 1
    private var totalIndex: Int = 8

    // MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setProgressView()
        setCollectionView()
    }

    // MARK: - Setup Methods
    private func setProgressView() {
        
    }
    
    private func setCollectionView() {
        
    }
}

