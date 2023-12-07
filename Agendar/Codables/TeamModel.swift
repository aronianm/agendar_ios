//
//  TeamModel.swift
//  Agendar
//
//  Created by Michael Aronian Aronian on 12/6/23.
//

import Foundation

struct TeamModel: Codable, Identifiable {
    var id:Int
    var name:String
    var players: [TeamPlayerModel]
}
