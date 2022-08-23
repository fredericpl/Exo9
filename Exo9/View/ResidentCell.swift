//
//  ResidentCell.swift
//  Exo9
//
//  Created by Plancquet Frederic on 22/08/2022.
//

import UIKit

class ResidentCell: UITableViewCell {
    
    @IBOutlet var name: UILabel!
    @IBOutlet var bdyDate: UILabel!
    @IBOutlet var filmCollectionCell: UICollectionView!
    
    var resident: People!

    override func awakeFromNib() {
        super.awakeFromNib()
        filmCollectionCell.dataSource = self
        filmCollectionCell.delegate = self
        // UICollectionViewDelegateFlowLayout
        filmCollectionCell.register(UINib(nibName: "ResidentCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ResidentCollectionViewCell")
        
    }
    
    func setup(resident: People) {
        self.resident = resident
        
        name.text = resident.name
        bdyDate.text = resident.birthYear
    }
    
    func film(at indexPath: IndexPath) -> Film? {
        Film.all.first { film in
            film.url == resident.films[indexPath.row]
        }
    }
    
}


extension ResidentCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        resident.films.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let film = film(at: indexPath)!
        let residentCollCell = filmCollectionCell.dequeueReusableCell(withReuseIdentifier: "ResidentCollectionViewCell", for: indexPath) as! ResidentCollectionViewCell
        
        residentCollCell.filmname.text = film.title
        return residentCollCell
    }
    
}




extension ResidentCell: UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
       
        let film = film(at: indexPath)!
        
        let textSize =
        film.title.boundingRect(
            with: CGSize(width: 1000, height: 0),
            options: .usesLineFragmentOrigin,
            attributes: [.font: UIFont.systemFont(ofSize: 15)],
            context: nil
        )

        return CGSize(width: textSize.width + 14, height: 26)
    }
    
    
}
