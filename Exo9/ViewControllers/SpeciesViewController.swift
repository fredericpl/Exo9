//
//  SpeciesViewController.swift
//  Exo9
//
//  Created by Plancquet Frederic on 22/08/2022.
//

import UIKit

class SpeciesViewController: UIViewController {
    
    @IBOutlet var speciesTableView: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        speciesTableView.register(UINib(nibName: "SpeciesCell", bundle: nil), forCellReuseIdentifier: "SpeciesCell")
        
        speciesTableView.dataSource = self
        speciesTableView.delegate = self
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SpeciesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Species.all.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let speciesCell = tableView.dequeueReusableCell(withIdentifier: "SpeciesCell", for: indexPath) as! SpeciesCell
        speciesCell.speciesName.text = Species.all[indexPath.row].name
        return speciesCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    
    
    
}
