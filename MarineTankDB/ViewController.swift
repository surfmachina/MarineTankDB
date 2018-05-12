//
//  ViewController.swift
//  MarineTankDB
//
//  Created by Thomas Carlson on 12/5/18.
//  Copyright © 2018 SurfMachina. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableview: UITableView!
    
    var marines : [Marinelife] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableview.dataSource = self
        tableview.delegate = self
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
        marines = try context.fetch(Marinelife.fetchRequest())
        tableview.reloadData()
        } catch {
            
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return marines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let marine = marines[indexPath.row]
        
        cell.textLabel?.text = marine.name
        cell.imageView?.image = UIImage(data: (marine.image as Data?)!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let marine = marines[indexPath.row]
        performSegue(withIdentifier: "marinesegue", sender: marine)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! AddMarineViewController
        nextVC.marine = sender as? Marinelife
    }
    
}

