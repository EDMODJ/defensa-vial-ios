//
//  ThirdViewController.swift
//  DefensaVial
//
//  Created by EDSON MOISES CORTES MOLINA on 1/28/17.
//  Copyright © 2017 mecabotware. All rights reserved.
//

import UIKit
import AVFoundation

class ThirdViewController: UIViewController {
    
    
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var btnStop: UIButton!
    
    var bombSoundEffect: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func playSound(_ sender: UIButton) {
        print("Entre reproducir")
        
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let docsDir = dirPaths[0]
        
        let soundFileURL = URL(fileURLWithPath: docsDir).appendingPathComponent("sound.m4a")
        
        //let path = NSBundle.mainBundle().pathForResource("evidencia.caf", ofType:nil)!
        //let url = NSURL(fileURLWithPath: path)
        
        do {
            let sound = try AVAudioPlayer(contentsOf: soundFileURL)
            bombSoundEffect = sound
            sound.play()
        } catch {
            print("Couldn't load file :(")
        }
        //let vc: BotonPanicoViewController = self.storyboard?.instantiateViewControllerWithIdentifier("BotonPanicoController") as! BotonPanicoViewController
        
    }
    
    @IBAction func stopSound(_ sender: UIButton) {
        if bombSoundEffect != nil {
            bombSoundEffect?.stop()
            bombSoundEffect = nil
        }
    }
    
}
