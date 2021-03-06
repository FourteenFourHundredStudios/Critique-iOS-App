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
    static var queue : QueueHandler?
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
    
    public static func isFollowing(_ username: String) -> Bool {
        for user in getMutuals(){
            if user.username == username {
                return true
            }
        }
        return false
    }
    
    public static func getMutuals() -> [User]{
        var mutualsList : [User] = []
        if let mutuals = getAttribute("mutuals") as? [[String:Any]]{
            for userInfo in mutuals {
                mutualsList.append(User(userInfo))
            }
        }
        return mutualsList
    }
    
    static func clear(){
        defaults.removeObject(forKey: "userData")
        defaults.synchronize()
        userData = [:]
        queue = nil
    }
    
    static func save(){
        defaults.set(userData, forKey: "userData")
        defaults.synchronize()
    }
    
    static func setAttribute(key : String, value: Any){
        userData[key] = value
     }
    
    static func getAttribute(_ attr : String) -> Any!{
        return userData[attr]
    }
    

    
    
}
