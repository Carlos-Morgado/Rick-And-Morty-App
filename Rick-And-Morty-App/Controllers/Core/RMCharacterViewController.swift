//
//  RMCharacterViewController.swift
//  Rick-And-Morty-App
//
//  Created by Carlos Morgado on 3/7/23.
//

import UIKit
/// Controller to show and search Characters
final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Characters"
        
        RMService.shared.execute(.listCharacterRequests, expecting: RMGetAllCharactersResponse.self) { result in
            switch result {
            case .success(let model):
                print("Total: "+String(model.info.count))
                print("Page result count: "+String(model.results.count))
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }

}
