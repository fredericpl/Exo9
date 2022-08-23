//
//  SpeciesCell.swift
//  Exo9
//
//  Created by Plancquet Frederic on 22/08/2022.
//

import UIKit

class SpeciesCell: UITableViewCell {
    
    @IBOutlet var speciesName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
