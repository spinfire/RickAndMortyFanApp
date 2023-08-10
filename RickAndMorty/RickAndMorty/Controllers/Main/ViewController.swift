//
//  ViewController.swift
//  RickAndMorty
//
//  Created by manuel benites rojas on 10/8/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loandingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    var characterList: [Character]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.getCharactersList()
        self.loandingIndicator.stopAnimating()

    }

    private func setupView(){
        tableView.delegate = self
        tableView.dataSource = self
        loandingIndicator.startAnimating()
        loandingIndicator.isHidden = false
        loandingIndicator.hidesWhenStopped = true
        let characterTableViewCell: UINib = UINib(nibName: CharacterTableViewCell.className, bundle: nil)
        self.tableView.register(characterTableViewCell, forCellReuseIdentifier: CharacterTableViewCell.className)
    }

    private func getCharactersList(){
        ApiManager.getCharacters { result in
            switch result{
            case .success(let characterData):
                self.characterList = characterData.results
            case .failure(let error):
                print("error: \(error)")
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let characterTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.className) as! CharacterTableViewCell
        if let characterList = characterList{
            characterTableViewCell.characterNameString = characterList[indexPath.row].name
            let imageDownloader = ImageDownloader()
            Task {
                do {
                    characterTableViewCell.characterImageView.image = try await imageDownloader.downloadImage(from: characterList[indexPath.row].image)
                } catch {
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
        return characterTableViewCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = characterList?.count else {
            return 0
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let yourViewController = DetailCharacterViewController(nibName: "DetailCharacterViewController", bundle: nil)
        if let characterList = characterList{
            yourViewController.character = characterList[indexPath.row]
            self.present(yourViewController, animated: true)
        }        
    }
    
//    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath){
//    }

}
