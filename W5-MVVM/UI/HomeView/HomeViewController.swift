//
//  HomeViewController.swift
//  W5-MVVM
//
//  Created by Văn Khánh Vương on 15/04/2021.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var userTableView: UITableView!
    let identifier = "MyTableViewCell"
    var viewModel = HomeViewModel()
    var arrayUserFormApi: [HomeViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }

    func setUpView() {
        let nib = UINib(nibName: identifier, bundle: nil)
        userTableView.register(nib, forCellReuseIdentifier: identifier)
        userTableView.dataSource = self
        viewModel.delegate = self
        
        //Call the Api from the model
        viewModel.getDataFromApi()
    }
}
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayUserFormApi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? MyTableViewCell else { return UITableViewCell() }
        let model = arrayUserFormApi[indexPath.row]
        cell.bildData(viewModel: MyTableViewCellsModels(name: model.name, age: model.age, gender: model.gender))
        return cell
    }
}
extension HomeViewController: HomeViewModelDelegate {
    func passData(arrayUser: [HomeViewModel]) {
        self.arrayUserFormApi = arrayUser
        DispatchQueue.main.async {
            self.userTableView.reloadData()
        }
    }
    func passError(messageError: String) {
        print(messageError)
    }
}

