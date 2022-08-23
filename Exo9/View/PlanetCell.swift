//
//  PlanetCell.swift
//  Exo9
//
//  Created by Plancquet Frederic on 22/08/2022.
//

import UIKit

class PlanetCell: UITableViewCell {
    
    @IBOutlet var planetName: UILabel!
    @IBOutlet var temperatures: UILabel!
    @IBOutlet var bouttonResident: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        bouttonResident.layer.cornerRadius = 15
    }
    
    
}
