//
//  Planet.swift
//  starwars
//
//  Created by Jérôme Danthinne on 19/08/2022.
//

import Foundation

struct Planet: Decodable {
    let name: String
    let rotationPeriod: String
    let orbitalPeriod: String
    let diameter: String
    let climate: String
    let gravity: String
    let terrain: String
    let surfaceWater: String
    let population: String
    let residents: [URL]
    let films: [URL]
    let url: URL
}

extension Planet {
    static var all: [Planet] = {
        let fileURL = Bundle.main.url(forResource: "planets", withExtension: "json")
        let data = try! Data(contentsOf: fileURL!)

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        return try! decoder.decode([Planet].self, from: data)
    }()
}
