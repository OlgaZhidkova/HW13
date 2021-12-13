//
//  ForYouViewController.swift
//  HW13
//
//  Created by Ольга on 13.12.2021.
//

import UIKit

class ForYouViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Для Вас"
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