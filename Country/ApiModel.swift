//
//  ApiModel.swift
//  Country
//
//  Created by Miriam Moe on 10/11/2023.
//

import Foundation

struct Country: Codable {
    var name: String
    var capital: String
    var altSpellings: [String]
}

