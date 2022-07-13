//
//  DogViewController.swift
//  dogAPI
//
//  Created by Kushal Vaghani on 13/07/2022.
//

import UIKit
import SDWebImage

class DogViewController: UIViewController {
    
    @IBOutlet weak var breedNameLabel: UILabel!
    @IBOutlet weak var dogImage: UIImageView!
    
    var breed = String()
    var breeds: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

       // self.breedNameLabel.text = breed
        
        Task{
            do{
                self.breeds = try await DogApi_ImageFull.fetchBreeds(breed: breed)
                breedNameLabel.text = "Total Images for \(breed) = " + String(breeds.count) //name and image count
                self.dogImage.sd_setImage(with: URL(string: self.breeds[0]), placeholderImage: UIImage()) //bringing in the dog image as soon the view is displayed + caching with sdwebimage, 
            }
            catch let err{
                print("something went wrong: \(err)")
            }
        }
    }
       
    @IBAction func randomImage(_ sender: Any) { //bringing in new image
        self.dogImage.sd_setImage(with: URL(string: self.breeds[Int.random(in: 0...self.breeds.count-1 )]), placeholderImage: UIImage())
    }
}

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
