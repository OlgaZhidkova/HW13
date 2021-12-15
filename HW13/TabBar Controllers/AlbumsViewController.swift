//
//  AlbumsViewController.swift
//  HW13
//
//  Created by Ольга on 13.12.2021.
//

import UIKit

class AlbumsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView(frame: .zero, style: .plain)
    var firstRowModels = [Model]()
    var secondRowModels = [Model]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupHierarchy()
        setupLayout()
        configureFirstRow()
        configureSecondRow()
        
        tableView.register(CommonAlbumsTableViewCell.nib(), forCellReuseIdentifier: CommonAlbumsTableViewCell.identifier)
        
        
        tableView.register(AlbumsTableViewCell.nib(), forCellReuseIdentifier: AlbumsTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func configureFirstRow() {
        firstRowModels.append(Model(text: "Недавние", imageName: "image_1", number: "1 234"))
        firstRowModels.append(Model(text: "Избранное", imageName: "image_2", number: "234"))
        firstRowModels.append(Model(text: "WhatsApp", imageName: "image_3", number: "1 089"))
        firstRowModels.append(Model(text: "Instagram", imageName: "image_4", number: "215"))
        firstRowModels.append(Model(text: "Фото", imageName: "image_5", number: "2 078"))
        firstRowModels.append(Model(text: "Путешествия", imageName: "image_6", number: "346"))
        firstRowModels.append(Model(text: "Обои", imageName: "image_7", number: "10"))
        firstRowModels.append(Model(text: "Фотосессия", imageName: "image_8", number: "35"))
    }
    
    func configureSecondRow() {
        secondRowModels.append(Model(text: "Недавние", imageName: "image_1", number: "1 234"))
        secondRowModels.append(Model(text: "Избранное", imageName: "image_2", number: "234"))
        secondRowModels.append(Model(text: "WhatsApp", imageName: "image_3", number: "1 089"))
        secondRowModels.append(Model(text: "Instagram", imageName: "image_4", number: "215"))
    }
    
    // MARK: - Settings
    
    private func setupView() {
        view.backgroundColor = .white
        title = "Альбомы"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    // MARK: - Table View
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: AlbumsTableViewCell.identifier) as! AlbumsTableViewCell
            cell.selectionStyle = .none
            cell.configure(with: firstRowModels)
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CommonAlbumsTableViewCell.identifier) as! CommonAlbumsTableViewCell
            cell.selectionStyle = .none
            cell.configure(with: secondRowModels)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height:CGFloat = CGFloat()
        if indexPath.row == 0 {
            height = 550
        } else if indexPath.row == 1 {
            height = 295
                }
        return height
    }
}

