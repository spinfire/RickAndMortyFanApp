//
//  AFWrapper.swift
//  RickAndMorty
//
//  Created by manuel benites rojas on 10/8/23.
//

import Foundation

final class AFWrapper: NSObject{
    static let sharedInstance: AFWrapper = {
        let instance = AFWrapper()
        return instance
    }()
}

extension AFWrapper{
    func request<T: Codable>(url: String, method: String,completionHandler: @escaping(Result<T,Error>)->Void) {
                guard let urlToUse = URL(string: url) else{ return }

        URLSession.shared.dataTask(with: urlToUse) {data, _, error in
            if let error = error {
                completionHandler(.failure(error))
            } else {
               completionHandler( Result{ try JSONDecoder().decode(T.self, from: data!)})
            }
        }.resume()

        }
}

