//
//  Film.swift
//  starwars
//
//  Created by Jérôme Danthinne on 19/08/2022.
//

import Foundation

struct Film: Decodable {
    let title: String
    let episodeId: Int
    let openingCrawl: String
    let director: String
    let producer: String
    let releaseDate: Date
    let characters: [URL]
    let planets: [URL]
    let species: [URL]
    let url: URL
}

extension Film {
    static var all: [Film] = {
        let fileURL = Bundle.main.url(forResource: "films", withExtension: "json")
        let data = try! Data(contentsOf: fileURL!)

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .formatted(dateFormatter)

        return try! decoder.decode([Film].self, from: data)
    }()
}
