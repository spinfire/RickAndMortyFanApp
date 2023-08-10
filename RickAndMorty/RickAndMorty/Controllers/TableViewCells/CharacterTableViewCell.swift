//
//  CharacterTableViewCell.swift
//  RickAndMorty
//
//  Created by manuel benites rojas on 10/8/23.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {

    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    var characterNameString = ""{
        didSet{
            self.nameLabel.text = "\(characterNameString)"
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupView()
    }
    
    private func setupView(){
        characterImageView.layer.cornerRadius = 16
        characterImageView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
