//
//  Characters.swift
//  RickAndMorty
//
//  Created by manuel benites rojas on 10/8/23.
//

import Foundation
//{
//    "info": {
//        "count": 826,
//        "pages": 42,
//        "next": "https://rickandmortyapi.com/api/character?page=2",
//        "prev": null
//    },
//    "results": [
    struct DataCharactersRequest: Codable {
        let info: Info
        let results: [Character]
    }

    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }

    struct Characters: Codable{
        let results: [Character]
//        enum CodingKeys: String, CodingKey {
//            case characters = "results"
//        }
    }

    struct Character: Codable{
            let id : Int
            let name: String
            let status: String
            let species: String
            let type: String
            let gender: String
            let origin: Origin
            let location: Location
            let image: String
            let episode: [String]
            let url: String
            let created: String
    }

    struct Origin: Codable {
        let name: String
        let url: String
    }

    struct Location: Codable {
        let name: String
        let url: String
    }
