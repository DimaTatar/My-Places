//
//  NewPlaceTableViewController.swift
//  My Places
//
//  Created by Дмитрий Татаринцев on 28.12.2021.
//

import UIKit

class NewPlaceTableViewController: UITableViewController {
    
    var newPlace: Place?
    
    var imageIsChanged = false
    
    @IBOutlet var placeImage: UIImageView!
    
    @IBOutlet var saveButton: UIBarButtonItem!
    
    @IBOutlet var placeNameTF: UITextField!
    @IBOutlet var placeLocationTF: UITextField!
    @IBOutlet var placeTypeTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveButton.isEnabled = false
        placeNameTF.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)

    }
    
    //MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
            let cameraIcon = UIImage(named: "camera")
            let photoIcon = UIImage(named: "photo")
            
            let actionSheet = UIAlertController(title: nil,
                                                message: nil,
                                                preferredStyle: .actionSheet)
            
            let camera = UIAlertAction(title: "Camera", style: .default) { _ in
                self.chooseImagePicker(source: .camera)
            }
            camera.setValue(cameraIcon, forKey: "image")
            
            let photo = UIAlertAction(title: "Photo", style: .default) { _ in
                self.chooseImagePicker(source: .photoLibrary)
            }
            photo.setValue(photoIcon, forKey: "image")
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            
            actionSheet.addAction(camera)
            actionSheet.addAction(photo)
            actionSheet.addAction(cancel)
            
            present(actionSheet, animated: true)
            
        } else {
            view.endEditing(true)
        }
    }
    
    func saveNewPlace() {
        
        var image: UIImage?
        
        if imageIsChanged {
            image = placeImage.image
        } else {
            image = UIImage(named: "imagePlaceholder2x")
        }
        
        newPlace = Place(name: placeNameTF.text!,
                         location: placeLocationTF.text,
                         type: placeTypeTF.text,
                         image: image,
                         restaurantImage: nil)
    }
    
    @IBAction func cancelAction(_ sender: Any) {
       dismiss(animated: true, completion: nil)
    }
}

//MARK: - Text field delegate

extension NewPlaceTableViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc private func textFieldChanged() {
        if placeNameTF.text?.isEmpty == false {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
    }
}

//MARK: - Work with image

extension NewPlaceTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        placeImage.image = info[.editedImage] as? UIImage
        placeImage.contentMode = .scaleToFill
        placeImage.clipsToBounds = true
        imageIsChanged = true
        dismiss(animated: true)
    }
}
