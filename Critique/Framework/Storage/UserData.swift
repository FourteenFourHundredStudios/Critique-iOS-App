//
//  Data.swift
//  Critique
//
//  Created by Marc Fervil on 3/6/18.
//  Copyright © 2018 Marc Fervil. All rights reserved.
//

import Foundation


class UserData {
    
    static var userData : [String:Any] = [:]
    static let defaults = UserDefaults.standard
    static let debug = true 
    
    public static func loadData() -> Bool{
        if let data = defaults.dictionary(forKey: "userData"){
            userData = data
            return true
        }else{
            return false
        }
    }
    
    static func save(){
        defaults.set(userData, forKey: "userData")
        defaults.synchronize()
    }
    
    static func setAttribute(key : String, value: Any){
        userData[key] = value
     }
    
    static func getAttribute(_ attr : String) -> Any!{
        return userData[attr]!
    }
    

    
    
}
