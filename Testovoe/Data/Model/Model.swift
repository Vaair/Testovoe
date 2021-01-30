//
//  Model.swift
//  Testovoe
//
//  Created by Лера Тарасенко on 28.01.2021.
//

import Foundation

struct Model: Codable {
    let data: [DataModel]
    let view: [String]
}

struct DataModel: Codable {
    let name: String
    let data: DataInstances
}

struct DataInstances: Codable {
    let url: String?
    let text: String?
    let selectedId: Int?
    let variants: [Variant]?
}

struct Variant: Codable {
    let id: Int
    let text: String
}

struct ListData {
    let url: String?
    let name: String?
    let text: String?
    let id: Int?
}
