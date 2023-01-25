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
    
    @IBOutlet weak var coinImage: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func ButtonPress(_ sender: UIButton) {
        let result = Int.random(in: 1..<3)
        
        playSound()
        
        if(result == 1){
            coinImage.image = UIImage(named: "Heads")
            label.text = "HEADS"
        }
        else if(result == 2){
            coinImage.image = UIImage(named: "Tails")
            label.text = "TAILS"
        }
        else{
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
        }    }

}

