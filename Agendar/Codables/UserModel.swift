//
//  UserModel.swift
//  Agendar
//
//  Created by Michael Aronian Aronian on 12/6/23.
//

import Foundation

struct UserModel: Codable {
    var id:Int
    var fname:String
    var lname:String
    var email:String
    var phoneNumber:String?
}
