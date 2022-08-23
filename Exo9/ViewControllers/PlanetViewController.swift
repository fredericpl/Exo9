//
//  ViewController.swift
//  Exo9
//
//  Created by Plancquet Frederic on 22/08/2022.
//

import UIKit

class PlanetViewController: UIViewController {
    
    @IBOutlet var planetTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        planetTableView.dataSource = self
        planetTableView.delegate = self
        planetTableView.register(UINib(nibName: "PlanetCell", bundle: nil), forCellReuseIdentifier: "PlanetCell")
        planetTableView.register(UINib(nibName: "PlanetHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "PlanetHeader")
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let planetVC = segue.destination as? ResidentViewController,
           let planet = sender as? Planet {
            planetVC.planet = planet
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let selectedIndex = planetTableView.indexPathForSelectedRow {
            planetTableView.deselectRow(at: selectedIndex, animated: true)
        }
    }


}

extension PlanetViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        Film.all.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Film.all[section].planets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let planetCell = tableView.dequeueReusableCell(withIdentifier: "PlanetCell", for: indexPath) as! PlanetCell
        
        let planets = Film.all[indexPath.section].planets
        
        let planetURL = planets[indexPath.row]
        let planet = Planet.all.first(where: {item in
                    return item.url == planetURL
                })!
            
        planetCell.temperatures.text = planet.climate
        planetCell.planetName.text = planet.name
        planetCell.bouttonResident.setTitle(planet.residents.count.description, for: .normal)
        planetCell.bouttonResident.isUserInteractionEnabled = false

            
        if planet.residents.isEmpty {
            planetCell.bouttonResident.isHidden = true
            planetCell.isUserInteractionEnabled = false
            planetCell.accessoryType = .none
            
            
        }
        
        return planetCell

    }


    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = planetTableView.dequeueReusableHeaderFooterView(withIdentifier: "PlanetHeader") as! PlanetHeader
        
        headerCell.directorName.text = Film.all[section].director
        headerCell.episodeName.text = Film.all[section].title
        headerCell.episodeNb.text = "EPISODE " + String(Film.all[section].episodeId)
        return headerCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        110
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        70
    }
    
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let planets = Film.all[indexPath.section].planets
       
       let planetURL = planets[indexPath.row]
       let planet = Planet.all.first(where: {item in
                   return item.url == planetURL
               })!
       performSegue(withIdentifier: "showResident", sender: planet)
  }
    
    
}


// let planetURL = episod.plantes.first!
// let planet = planets.all.first { item in item.url == planetURL } 
