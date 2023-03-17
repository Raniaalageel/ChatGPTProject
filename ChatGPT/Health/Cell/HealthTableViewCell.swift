//
//  HealthTableViewCell.swift
//  ChatGPT
//
//  Created by Amani Aldahmash on 17/03/2023.
//

import UIKit

class HealthTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageUIView: UIImageView!
    @IBOutlet weak var loacationButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupUI(_ healthModel: HealthModel){
        titleLabel.text = healthModel.title
        imageUIView.image  = UIImage(named: healthModel.image)
    }
}


