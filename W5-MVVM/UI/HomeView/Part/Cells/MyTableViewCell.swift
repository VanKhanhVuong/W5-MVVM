//
//  MyTableViewCell.swift
//  W5-MVVM
//
//  Created by Văn Khánh Vương on 22/04/2021.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func bildData(viewModel : HomeViewModels) {
        self.nameLabel.text = "Name: " + viewModel.name
        self.genderLabel.text = "Gender: " + viewModel.gender
        self.ageLabel.text = "Age: \(viewModel.age)"
    }
}
