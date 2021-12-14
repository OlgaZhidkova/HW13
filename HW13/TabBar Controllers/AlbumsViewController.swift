//
//  AlbumsViewController.swift
//  HW13
//
//  Created by Ольга on 13.12.2021.
//

import UIKit

class AlbumsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView(frame: .zero, style: .plain)
    var models = [Model]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupHierarchy()
        setupLayout()
        configure()
        
        tableView.register(AlbumsTableViewCell.nib(), forCellReuseIdentifier: AlbumsTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func configure() {
        models.append(Model(text: "Недавние", imageName: "image_1", number: "1 234"))
        models.append(Model(text: "Избранное", imageName: "image_2", number: "234"))
        models.append(Model(text: "WhatsApp", imageName: "image_3", number: "1 089"))
        models.append(Model(text: "Instagram", imageName: "image_4", number: "215"))
        models.append(Model(text: "Фото", imageName: "image_5", number: "2 078"))
        models.append(Model(text: "Путешествия", imageName: "image_6", number: "346"))
        models.append(Model(text: "Обои", imageName: "image_7", number: "10"))
        models.append(Model(text: "Фотосессия", imageName: "image_8", number: "35"))
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AlbumsTableViewCell.identifier, for: indexPath) as! AlbumsTableViewCell
        cell.configure(with: models)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 510
    }
}

