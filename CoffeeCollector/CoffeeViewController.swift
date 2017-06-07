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
    @IBOutlet weak var addUpdateButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    var imagePicker = UIImagePickerController()
    var coffee : Coffee? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imagePicker.delegate = self
        
        if  coffee != nil {
            coffeeImageView.image = UIImage(data: coffee!.image as! Data)
            titleTextField.text = coffee?.title
            addUpdateButton.setTitle("Update", for: .normal)
        } else {
            deleteButton.isHidden = true
        }
        
    }

    @IBAction func cameraTapped(_ sender: Any) {
        
        imagePicker.sourceType = .camera
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func photosTapped(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        coffeeImageView.image = image
        
        imagePicker.dismiss(animated: true, completion: nil)
    }

    @IBAction func addTapped(_ sender: Any) {
        
        if coffee != nil {
            coffee!.title = titleTextField.text
            coffee!.image = UIImagePNGRepresentation(coffeeImageView.image!) as NSData?
            
        } else {
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let coffee = Coffee(context: context)
            coffee.title = titleTextField.text
            coffee.image = UIImagePNGRepresentation(coffeeImageView.image!) as NSData?
            
        }
        
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
    }
    @IBAction func deleteTapped(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        context.delete(coffee!)
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
        
    }
    
}
