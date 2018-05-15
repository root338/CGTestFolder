//
//  CGKeychain.swift
//  CGTestKeychain
//
//  Created by apple on 2018/4/10.
//  Copyright © 2018年 apple. All rights reserved.
//

import UIKit
import Security

class CGKeychain: NSObject {
    
    // MARK: Types
    enum KeychainError : Error {
        case noPassword
    }
    
    class func getPassword(service: String, account: String, accessGroup: String? = nil) throws -> String {
        
        let item = CGKeychainItem.init(service: service, account: account, accessGroup: accessGroup)
        return try selectOneItem(item)
    }
    
    class func selectOneItem(_ item: CGKeychainItem) throws -> String {
        
        
    }
    
    private class func keychainQuery(service: String, account: String?, accessGroup: String? = nil) -> [String : AnyObject] {
        
        var query = [String : AnyObject]()
        query[kSecClass as String]  = kSecClassGenericPassword
        query[kSecAttrService as String] = service as AnyObject?
        
        if let account = account {
            query[kSecAttrAccount as String] = account as AnyObject?
        }
        
        if let accessGroup = accessGroup {
            query[kSecAttrAccessGroup as String] = accessGroup as AnyObject?
        }
        return query
    }
    
}

class CGKeychainItem: NSObject {
    
    // MARK: Properties
    let serviceName : String
    let accountName : String
    var accessGroup : String?
    
    // MARK: Intialization
    init(service: String, account: String, accessGroup: String? = nil) {
        
        self.serviceName    = service
        self.accountName    = account
        self.accessGroup    = accessGroup
        super.init()
    }
    
    fileprivate var query : [String : AnyObject]  {
        
        var query = [String : AnyObject]()
        query[kSecAttrService as String]  = self.serviceName
        query[ksec]
    }
}
