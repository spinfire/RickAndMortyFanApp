//
//  DetailCharacterViewController.swift
//  RickAndMorty
//
//  Created by manuel benites rojas on 10/8/23.
//

import UIKit

class DetailCharacterViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    var character: Character?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }

    private func setupView(){
        if let character = character{
            let imageDownloader = ImageDownloader()
            Task {
                do {
                    imageView.image = try await imageDownloader.downloadImage(from: character.image)
                } catch {
                    print("Error: \(error.localizedDescription)")
                }
            }
            nameLabel.text = character.name
            statusLabel.text = character.status
            speciesLabel.text = character.species
            genderLabel.text = character.gender
            originLabel.text = character.origin.name
            locationLabel.text = character.location.name
            imageView.layer.cornerRadius = 16
            imageView.layer.masksToBounds = true
        }
    }
}
