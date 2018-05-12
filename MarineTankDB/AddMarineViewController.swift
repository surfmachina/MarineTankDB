//
//  AddMarineViewController.swift
//  MarineTankDB
//
//  Created by Thomas Carlson on 12/5/18.
//  Copyright © 2018 SurfMachina. All rights reserved.
//

import UIKit

class AddMarineViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var MarineNameTextField: UITextField!
    
    @IBOutlet weak var MarineImageView: UIImageView!
    
    var imagepicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagepicker.delegate = self
        
        // Do any additional setup after loading the view.
    }

    @IBAction func PhotosTapped(_ sender: Any) {
        imagepicker.sourceType = .photoLibrary
        
        present(imagepicker, animated: true, completion: nil)
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        MarineImageView.image = image
        
        imagepicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func CameraTapped(_ sender: Any) {
    }
    
    @IBAction func AddTapped(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let marine = Marinelife(context: context)
        marine.name = MarineNameTextField.text
        marine.image = UIImagePNGRepresentation(MarineImageView.image!)
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
    }
}
