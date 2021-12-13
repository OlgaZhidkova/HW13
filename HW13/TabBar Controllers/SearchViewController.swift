//
//  SearchViewController.swift
//  HW13
//
//  Created by Ольга on 13.12.2021.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Поиск"
        navigationController?.navigationBar.prefersLargeTitles = true

    }
    
    // MARK: - Initial
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder )
    }
}
