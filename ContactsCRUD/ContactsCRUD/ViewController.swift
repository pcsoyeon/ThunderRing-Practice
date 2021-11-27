//
//  ViewController.swift
//  ContactsCRUD
//
//  Created by soyeon on 2021/11/27.
//

import UIKit
import Contacts

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    let store = CNContactStore()
    var contacts: NSMutableArray = NSMutableArray()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        readContacts()
    }
}

// MARK: - CRUD Contacts Methods

extension ViewController {
    private func readContacts() {
        let store = CNContactStore()
        
        // Permission 획득
        store.requestAccess(for: .contacts) { (granted, error) in
            guard granted else {
                return;
            }
            
            // Request 생성
            let request: CNContactFetchRequest = self.getCNContactFetchRequest()
            
            // 주소록 읽을 때 정렬해서 읽어오도록 설정
            request.sortOrder = CNContactSortOrder.userDefault
            
            // Contacts 읽기
            // 주소록이 1개씩 읽혀서 usingBlock으로 들어온다.
            try! store.enumerateContacts(with: request, usingBlock: { (contact, stop) in
                
                // Phone No가 없을때 return
                if contact.phoneNumbers.isEmpty {
                    return
                }
                
                // NSMutableArray Add contact
                // 읽어온 주소록을 NSMutableArray에 저장
                self.contacts.add(contact)
                
            })
            
            dump(self.contacts)
//            self.saveContact()
        }
    }
    
    // Read
    private func getCNContactFetchRequest() -> CNContactFetchRequest {
        // 주소록에서 읽어올 key 설정
        let keys: [CNKeyDescriptor] = [CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
                                       CNContactPhoneNumbersKey,
                                       CNContactEmailAddressesKey,
                                       CNContactJobTitleKey,
                                       CNContactPostalAddressesKey] as! [CNKeyDescriptor]
        
        return CNContactFetchRequest(keysToFetch: keys)
    }
    
    // Update
    private func saveContact() {
        
        let store = CNContactStore()
        
        // Permission 획득
        store.requestAccess(for: .contacts) { (granted, error) in
            guard granted else {
                return;
            }
            
            let contact:CNMutableContact = self.getNewContact()
            
            let request = CNSaveRequest()
            request.add(contact, toContainerWithIdentifier:nil)
            
            // 저장
            try! store.execute(request)
        }
    }
    
    private func getNewContact() -> CNMutableContact {
        let contact = CNMutableContact()
        contact.givenName = "SO"
        contact.familyName = "KYTE"
        
        let phone = CNLabeledValue(label:CNLabelPhoneNumberMobile,
                                   value:CNPhoneNumber(stringValue:"010-0000-0000"))
        let tel = CNLabeledValue(label:CNLabelPhoneNumberMain,
                                 value:CNPhoneNumber(stringValue:"02-0000-0000"))
        contact.phoneNumbers = [phone, tel]
        
        let email: NSString = "SOKYTE@gmail.com"
        contact.emailAddresses = [CNLabeledValue(label:CNLabelWork, value:email)]
        
        return contact
    }
}







