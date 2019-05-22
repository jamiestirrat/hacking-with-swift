//
//  ViewController.swift
//  HWS-P10-NamesToFaces
//
//  Created by jamie stirrat on 21/05/2019.
//  Copyright © 2019 jamie stirrat. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var people = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //add button for selecting new people
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewPerson))
        
        //load array back from disk - essentially the save() method in reverse
        let defaults = UserDefaults.standard //defaults from UserDefaults
        if let savedPeople = defaults.object(forKey: "people") as? Data { //saved people as pulled out optional data
            people = NSKeyedUnarchiver.unarchiveObject(with: savedPeople) as! [Person] //unarchive to convert back to object graph - our array of people.
        //as in ViewDidLoad method will be loaded with the view
        }
        
        print("viewDidLoad is clear")
    }

        //Program View Controller - numberOfItemsInSection - How many items in each section
        //Change collectionView method, NumberOfItemsInSection to equal the count of people
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("collection view setup 'no items' is clear")
        return people.count
    }
    
        //Program View Controller - cellForItemAt
        //Show the correct information in each cell (also format the cell to our liking)  *
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Person", for: indexPath) as! PersonCell //returns and recycles cells - cell is cast as PersonCell - our programmed cell.
            let person = people[indexPath.item]
            cell.name.text = person.name
            let path = getDocumentsDirectory().appendingPathComponent(person.image)
            cell.imageView.image = UIImage(contentsOfFile: path.path)
            cell.imageView.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
            cell.imageView.layer.borderWidth = 2
            cell.imageView.layer.cornerRadius = 3
            cell.layer.cornerRadius = 7
            print("collection view setup 'return type at' is clear")
                return cell
        
}
    
    // Method to present image picker on pressing on button on nav bar
    @objc func addNewPerson() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate
        present(picker, animated: true)
        print("viewDidLoad is clear")
    }
    
    //Added Picker and Nav Delegates to ViewController inheritance ABOVE (Nav allows cancel or selection with picker)
    //Picker controller methods 1. to return selected data
    //Code for creating and appending new person added to Picker method
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.editedImage]
            as? UIImage else { return }
        let imageName = UUID().uuidString
        let imagePath =
            getDocumentsDirectory().appendingPathComponent(imageName)
        if let jpegData = image.jpegData(compressionQuality: 0.75) {
            try? jpegData.write(to: imagePath)
        }
        let person = Person(name: "Unknown", image: imageName)
        people.append(person)
        collectionView?.reloadData()
        dismiss(animated: true)
        save()
        print("ImagePicker is clear")
        
    }
    
    //Picker controller methods 2. to store that data
    func getDocumentsDirectory() -> URL {
        let paths =
            FileManager.default.urls(for: .documentDirectory,
                                     in: .userDomainMask)
        let documentsDirectory = paths[0]
        print("image stored as data")
        return documentsDirectory
    }
    
    //Name Change method using UIAlert added to new collectionView method (didSelectItemAt)
    override func collectionView(_ collectionView:
        UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let person = people[indexPath.item]
        let ac = UIAlertController(title: "Rename person", message:
            nil, preferredStyle: .alert)
        ac.addTextField()
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        ac.addAction(UIAlertAction(title: "OK", style: .default)
        { [unowned self, ac] _ in
            let newName = ac.textFields![0]
            person.name = newName.text!
            self.collectionView?.reloadData()
            self.save() //self.save needed as we are in a closure
        })
        present(ac, animated: true)
        print("name changer clear")
    }
    
    func save() {
        let savedData = NSKeyedArchiver.archivedData(withRootObject: people) //converts our array of people into a data object
        let defaults = UserDefaults.standard //save data
        defaults.set(savedData, forKey: "people") //save data
    }
}

