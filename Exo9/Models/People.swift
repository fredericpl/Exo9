//
//  People.swift
//  starwars
//
//  Created by Jérôme Danthinne on 20/08/2022.
//

import Foundation

struct People: Decodable {
    let name: String
    let height: String
    let mass: String
    let hairColor: String
    let skinColor: String
    let birthYear: String
    let gender: String
    let homeworld: String
    let films: [URL]
    let species: [URL]
    let url: URL
}

extension People {
    static var all: [People] = {
        let fileURL = Bundle.main.url(forResource: "people", withExtension: "json")
        let data = try! Data(contentsOf: fileURL!)

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        return try! decoder.decode([People].self, from: data)
    }()
}
