//
//  ResidentCollectionViewCell.swift
//  Exo9
//
//  Created by Plancquet Frederic on 22/08/2022.
//

import UIKit

class ResidentCollectionViewCell: UICollectionViewCell {

    @IBOutlet var filmname : UILabel!
    @IBOutlet var view: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        view.layer.cornerRadius = 8
        filmname.layer.cornerRadius = 8
                // Initialization code
    }

}
