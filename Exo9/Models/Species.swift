//
//  Species.swift
//  starwars
//
//  Created by Jérôme Danthinne on 20/08/2022.
//

import Foundation

struct Species: Decodable {
    let name: String
    let classification: String
    let designation: String
    let averageHeight: String
    let skinColors: String
    let hairColors: String
    let averageLifespan: String
    let homeworld: URL?
    let language: String
    let people: [URL]
    let films: [URL]
    let url: URL
}

extension Species {
    static var all: [Species] = {
        let fileURL = Bundle.main.url(forResource: "species", withExtension: "json")
        let data = try! Data(contentsOf: fileURL!)

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        return try! decoder.decode([Species].self, from: data)
    }()
}
