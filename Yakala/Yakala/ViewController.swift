//
//  ViewController.swift
//  Yakala
//
//  Created by Emre Gürbüz on 7.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    // kullanıcı adının girilmesi için textF tanımlama
    @IBOutlet weak var playerNameTextF : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    // Button aksiyonu oluşturuldu ve kulalnıcı adı girilmeden diğer ekrana geçilmemesi
    @IBAction func startGame(){
        if playerNameTextF.text != "" {
            performSegue(withIdentifier: "seque" , sender: nil)
            
        }
        
    }
    // ekran geçişi
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "seque"{
            let destination = segue.destination as! gameViewController
            destination.userName = playerNameTextF.text!
        }
        
    }}

