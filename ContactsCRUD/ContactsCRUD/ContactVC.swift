//
//  ContactsVC.swift
//  ContactsCRUD
//
//  Created by soyeon on 2021/11/27.
//

import UIKit
import Contacts

class ContactVC: UIViewController {

    // MARK: - UI
    
    @IBOutlet weak var contactTableView: UITableView!
    
    // MARK: - Properties
    
    let app = UIApplication.shared.delegate as! AppDelegate
    
    private let contactStroe = CNContactStore()
    private var contacts = [ContactDataModel]()
    
    private var buttonIndex: Int = 0
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactTableView.register(UINib(nibName: ContactTVC.identifier, bundle: nil), forCellReuseIdentifier: ContactTVC.identifier)
        contactTableView.dataSource = self
        
        contactStroe.requestAccess(for: .contacts) { (success, error) in
            if success {
                print("주소록 접근 가능")
            }
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getContacts()
    }
}

extension ContactVC {
    private func getContacts() {
        let key = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey] as [CNKeyDescriptor]
        let request = CNContactFetchRequest(keysToFetch: key)
        
        contactStroe.requestAccess(for: .contacts) { (success, error) in
            if (success) {
                // 주소록 접근 허용
                do {
                    try! self.contactStroe.enumerateContacts(with: request, usingBlock: { (contact, stop) in
                        let name = contact.givenName
                        let familyName = contact.familyName
                        
                        var number: String
                        if contact.phoneNumbers.isEmpty {
                            number = "번호 없음"
                        } else {
                            number = (contact.phoneNumbers.first?.value.stringValue)!
                        }
                        let contactsToAppend = ContactDataModel(givenName: name, familyName: familyName, phoneNumber: number)
                        self.contacts.append(contactsToAppend)
                    })
                }
            } else {
                // 주소록 권한 비허용 -> 알람 메시지
                let alert = UIAlertController(title: "알림", message: "연락처 연동을 해야 니 친구들을 넣지.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { (UIAction) -> Void in
                    let settingURL = NSURL(string: UIApplication.openSettingsURLString) as! URL
                    UIApplication.shared.open(settingURL, options: [:], completionHandler: nil)
                }))
                self.present(alert, animated: true, completion: nil)
            }
        }
        contactTableView.reloadData()
    }
}

extension ContactVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContactTVC.identifier, for: indexPath as IndexPath) as! ContactTVC
        cell.nameLabel.text = contacts[indexPath.row].givenName + contacts[indexPath.row].familyName
        return cell
    }
}
