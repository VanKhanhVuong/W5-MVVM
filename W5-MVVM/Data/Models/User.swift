//
//  User.swift
//  W5-MVVM
//
//  Created by Văn Khánh Vương on 22/04/2021.
//

import Foundation

struct Root : Codable {
    let users : [Users]
}

struct Users : Codable {
    let gender : String
    let age : Int
    let name : String
}
