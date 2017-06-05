//
//  CoffeeViewController.swift
//  CoffeeCollector
//
//  Created by Sebastian Asp on 2017-06-05.
//  Copyright © 2017 Sebastian Asp. All rights reserved.
//

import UIKit

class CoffeeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var coffeeImageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imagePicker.delegate = self
    }

    @IBAction func cameraTapped(_ sender: Any) {
    }
    
    @IBAction func photosTapped(_ sender: Any) {
        
        imagePicker.sourceType = .savedPhotosAlbum
        
        present(imagePicker, animated: true, completion: nil)
    }


    @IBAction func addTapped(_ sender: Any) {
    }
}
