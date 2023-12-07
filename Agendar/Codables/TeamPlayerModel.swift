//
//  TeamPlayerModel.swift
//  Agendar
//
//  Created by Michael Aronian Aronian on 12/7/23.
//

import Foundation

struct TeamPlayerModel: Codable, Identifiable, Hashable {
    var id:Int
    var formatted_name:String
    var email:String
    var phone_number:String
}
