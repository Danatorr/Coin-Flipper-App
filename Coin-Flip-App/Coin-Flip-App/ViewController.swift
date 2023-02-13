//
//  ViewController.swift
//  Coin-Flip-App
//
//  Created by Daniel Torres on 23/01/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer?
    
    @IBOutlet weak var languageImage: UIButton!
    @IBOutlet weak var coinImage: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var flipButton: UIButton!
    
    var result = 0
    var language = "en"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func ButtonPress(_ sender: UIButton) {
        //Reduces the sender's (the button that got pressed) opacity to half.
        sender.alpha = 0.5

        //Code should execute after 0.2 second delay.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            //Bring's sender's opacity back up to fully opaque.
            sender.alpha = 1.0
        }

        
        let pressedButton = sender.tag
        
        switch pressedButton {
            case 1:
                flip()
            case 2:
                changeLanguage()
            default:
                break
        }
    }
    
    func changeLanguage(){
        if(language == "en"){
            languageImage.setImage(UIImage(named: "USAFlag"), for: .normal)
            flipButton.setTitle("JOGAR", for: .normal)
        } else if(language == "pt"){
            languageImage.setImage(UIImage(named: "BrazilFlag"), for: .normal)
            flipButton.setTitle("FLIP", for: .normal)
        }

        
        if(language == "en"){
            language = "pt"
        } else if(language == "pt"){
            language = "en"
        }
        
        if(language == "en" && result == 1){
            coinImage.image = UIImage(named: "Heads")
            label.text = "HEADS"
        } else if(language == "en" && result == 2){
            coinImage.image = UIImage(named: "Tails")
            label.text = "TAILS"
        } else if(language == "pt" && result == 1){
            coinImage.image = UIImage(named: "Cara")
            label.text = "CARA"
        } else if(language == "pt" && result == 2){
            coinImage.image = UIImage(named: "Coroa")
            label.text = "COROA"
        } else{
            label.text = "???"
        }
    }
    
    func flip(){
        result = Int.random(in: 1..<3)
        
        playSound()
        
        if(language == "en" && result == 1){
            coinImage.image = UIImage(named: "Heads")
            label.text = "HEADS"
        } else if(language == "en" && result == 2){
            coinImage.image = UIImage(named: "Tails")
            label.text = "TAILS"
        } else if(language == "pt" && result == 1){
            coinImage.image = UIImage(named: "Cara")
            label.text = "CARA"
        } else if(language == "pt" && result == 2){
            coinImage.image = UIImage(named: "Coroa")
            label.text = "COROA"
        } else{
            label.text = "???"
        }
    }
    
    func playSound() {
        guard let path = Bundle.main.path(forResource: "coinFlip", ofType:"mp3") else {
            return }
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

