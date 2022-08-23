//
//  ResidentViewController.swift
//  Exo9
//
//  Created by Plancquet Frederic on 22/08/2022.
//

import UIKit

class ResidentViewController: UIViewController {
    
    var planet: Planet!
    @IBOutlet var residentTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = planet.name
        
        
        residentTableView.delegate = self
        residentTableView.dataSource = self
        residentTableView.register(UINib(nibName: "ResidentCell", bundle: nil), forCellReuseIdentifier: "ResidentCell")
        residentTableView.register(UINib(nibName: "ResidentHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "ResidentHeader")

        // Do any additional setup after loading the view.
    }
    

}

extension ResidentViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        planet.residents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let residentCell = tableView.dequeueReusableCell(withIdentifier: "ResidentCell", for: indexPath) as! ResidentCell
        
        let residents = planet.residents
        let residentURL = residents[indexPath.row]
        let resident = People.all.first(where: { item in
            return item.url == residentURL
        } )
        residentCell.setup(resident: resident!)
        
        return residentCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        75
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = residentTableView.dequeueReusableHeaderFooterView(withIdentifier: "ResidentHeader") as! ResidentHeader
        cell.residentLb.text = "Residents"
        cell.numberResident.text = planet.residents.count.description
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    
    
    
    
}
