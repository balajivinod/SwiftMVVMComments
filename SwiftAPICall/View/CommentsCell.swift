//
//  CommentsCell.swift
//  SwiftAPICall
//
//  Created by Balaji Duraisamy on 03/09/23.
//

import UIKit

class CommentsCell: UITableViewCell {

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateView(model: CommentsModel) {
        emailLabel.text = model.email
        nameLabel.text = model.name
        idLabel.text = String(describing: model.id)
    }
}
