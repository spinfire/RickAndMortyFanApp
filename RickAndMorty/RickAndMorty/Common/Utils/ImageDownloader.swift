//
//  ImageDownloader.swift
//  RickAndMorty
//
//  Created by manuel benites rojas on 10/8/23.
//

import Foundation
import UIKit

class ImageCache {
    private var cache: [URL: UIImage] = [:]

    func cacheImage(_ image: UIImage, for url: URL) {
        cache[url] = image
    }

    func image(for url: URL) -> UIImage? {
        return cache[url]
    }
}

class ImageDownloader {
    private let imageCache = ImageCache()

    func downloadImage(from imagePath: String) async throws -> UIImage {
        if let url = URL(string: imagePath){
            if let cachedImage = imageCache.image(for: url) {
                return cachedImage
            }

            let data = try await downloadImageData(from: url)
            guard let image = UIImage(data: data) else {
                throw NSError(domain: "InvalidImageData", code: 0, userInfo: nil)
            }
            imageCache.cacheImage(image, for: url)
            return image
        }
        else{
           return UIImage()
        }
    }
    
    func downloadImageData(from url: URL) async throws -> Data {
        let request = URLRequest(url: url)
        let (data, _) = try await URLSession.shared.data(for: request)
        return data
    }
}
