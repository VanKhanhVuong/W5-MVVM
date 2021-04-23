//
//  HomeViewModel.swift
//  W5-MVVM
//
//  Created by Văn Khánh Vương on 22/04/2021.
//

import Foundation
protocol HomeViewModelDelegate: class {
    func passData(arrayUser: [HomeViewModel])
    func passError(messageError: String)
}
class HomeViewModel {
    weak var delegate: HomeViewModelDelegate?
    var name: String = ""
    var age: Int = 0
    var gender: String = ""
    var apiService = APIService()
    var arrayUser:[HomeViewModel] = []
    
    func getDataFromApi() {
        apiService.apiToGetUsersData { [weak self] result in
            guard let self = self else { return }
            if !result.isEmpty {
                for i in 0..<result.count {
                    let dataUser = result[i]
                    let homeModel = HomeViewModel()
                    homeModel.name = dataUser.name
                    homeModel.age = dataUser.age
                    homeModel.gender = dataUser.gender
                    self.arrayUser.append(homeModel)
                }
                self.delegate?.passData(arrayUser: self.arrayUser)
            } else {
                self.delegate?.passError(messageError: "Sorry we cannot get the data please try again later !")
            }
        }
        
    }
}
