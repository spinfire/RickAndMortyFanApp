//
//  ApiManager.swift
//  RickAndMorty
//
//  Created by manuel benites rojas on 10/8/23.
//

import Foundation


import Foundation

struct ApiManager{
    
    fileprivate static let characters = "\(apiUrl)/character"
    
    static func getCharacters(completionHandler: @escaping (Result<DataCharactersRequest, Error>) -> Void){
        let url = "\(characters)"
        AFWrapper.sharedInstance.request(url: url, method: "GET") { (result) in
            completionHandler(result)
        }
    }
}
