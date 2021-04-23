//
//  APIService.swift
//  W5-MVVM
//
//  Created by Văn Khánh Vương on 22/04/2021.
//

import Foundation

struct APIService {
    private let sourcesURL = URL(string: "http://www.json-generator.com/api/json/get/cfWVCViYHS?indent=2")!
    var paidData: Bool = false
    func apiToGetUsersData(completion: @escaping ([Users]) -> ()){
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                do {
                    let result = try jsonDecoder.decode(Root.self, from: data)
                    completion(result.users)
                } catch {
                    print("error on decode: \(error.localizedDescription)")
                }
            }
        }.resume()
    }
}
