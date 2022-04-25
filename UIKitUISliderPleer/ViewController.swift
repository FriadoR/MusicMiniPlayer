//
//  ViewController.swift
//  UIKitUISliderPleer
//
//  Created by Сергей Саченко on 20.04.2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var LabelPlayList: UILabel!
    
    @IBOutlet weak var imageFirstSong: UIImageView!
    @IBOutlet weak var imageSecondSong: UIImageView!
    
    @IBOutlet weak var buttonNameSong: UIButton!
    @IBOutlet weak var buttonNameSinger: UIButton!
    @IBOutlet weak var labelTimeSong: UILabel!
    
    @IBOutlet weak var buttonNameSong2: UIButton!
    @IBOutlet weak var buttonNameSinger2: UIButton!
    @IBOutlet weak var labelTimeSong2: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageFirstSong.image = UIImage(named: "bumer")
        imageSecondSong.image = UIImage(named: "jazz")
        
        labelTimeSong.text = "4:04"
        labelTimeSong2.text = "3:30"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showView",
           let destination = segue.destination as? SecondViewController {
            
            destination.name = "Черный бумер"
            destination.nameSinger = "Серега"
            destination.imageSong11 = imageFirstSong.image!
            destination.timeSong = 244
            
            do {
                if let audioPath = Bundle.main.path(forResource: "Song1", ofType: "mp3") {
                    try destination.player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            }
            }    catch {
                print("Error")
            }
                destination.player.play()
        }
            
            if segue.identifier == "showView2",
                let destination = segue.destination as? SecondViewController {
                
                destination.name = "Relax"
                destination.nameSinger = "Jazz"
                destination.imageSong11 = imageSecondSong.image!
                destination.timeSong = 210
                
                do {
                    if let audioPath = Bundle.main.path(forResource: "Song2", ofType: "mp3") {
                        try destination.player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                }
                } catch {
                    print("Error")
                }
                    destination.player.play()
                }
            }

        }
            
    
    

