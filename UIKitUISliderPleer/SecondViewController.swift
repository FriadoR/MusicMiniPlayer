//
//  SecondViewController.swift
//  UIKitUISliderPleer
//
//  Created by Сергей Саченко on 20.04.2022.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController {

    @IBOutlet weak var labelPlayingFromAlbum: UILabel!
    @IBOutlet weak var labelSongName: UILabel!
    
    @IBOutlet weak var imageSong: UIImageView!
    
    @IBOutlet weak var labelNameSong1: UILabel!
    @IBOutlet weak var labelNameSinger: UILabel!
    
    @IBOutlet weak var buttonPlus: UIButton!
    @IBOutlet weak var buttomSettings: UIButton!
    
    @IBOutlet weak var buttonShuffle: UIButton!
    @IBOutlet weak var buttonRepeat: UIButton!
    

    @IBOutlet weak var sliderSong: UISlider!
    @IBOutlet weak var sliderVolume: UISlider!
    
    @IBOutlet weak var labelTimeStart: UILabel!
    @IBOutlet weak var labelTimeFinish: UILabel!
    
    
    var player = AVAudioPlayer()
    
    var name = ""
    var nameSinger = ""
    
    var imageSong11 = UIImage()
    
    var timer: Timer?
    
    var timeSong: Double = Double()
    
    var count = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageSong.image = imageSong11
        
        labelSongName.text = name
        labelNameSong1.text = name
        labelNameSinger.text = nameSinger
        
        sliderSong.maximumValue = Float(player.duration)
        sliderSong.addTarget(self, action: #selector(sliderValue), for: .valueChanged)
        
        sliderVolume.maximumValue = Float(player.volume)
        player.volume = sliderVolume.value
        
        // создаем таймер с интервалом 1 сек
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
        labelTimeStart.text = ""
        labelTimeFinish.text = ""
    }
    
    // timer song from start & finish
    
    @objc func updateTime() {
        
        let timePlayed = player.currentTime
        let minutes = Int(timePlayed / 60)
        let seconds = Int(timePlayed.truncatingRemainder(dividingBy: 60))
        labelTimeStart.text = NSString(format: "%02D:%02D", minutes, seconds) as String
        
        let difftime = player.currentTime - timeSong
        let minutes1 = Int(difftime / 60)
        let seconds1 = Int(-difftime.truncatingRemainder(dividingBy: 60))
        labelTimeFinish.text = NSString(format: "%02D:%02D", minutes1, seconds1) as String
        
        sliderSong.setValue(Float(self.player.currentTime), animated: true)
    }
    
    
    @IBAction func sliderVolumeButton(_ sender: Any) {
    player.volume = sliderVolume.value
    }
    
    @objc func sliderValue(sender: UISlider) {
       
        if sender == sliderSong {
            self.player.currentTime = TimeInterval(sender.value)
        }
    }
    

    
    
    @IBAction func playPauseABotton(_ sender: Any) {
    if player.isPlaying {
           
            player.pause()
//            sender.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
//            sender.tintColor = .lightGray
        
        } else {
            player.play()
//            sender.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
//            sender.tintColor = .lightGray
        }
    }
    
    // Button back
    
        
    @IBAction func backButtonSongs(_ sender: Any) {
    if self.count < 2 {
            self.count += 1
        } else {
            self.count = 1
        }
        
        let audioPath = Bundle.main.path(forResource: "Song\(self.count)", ofType: "mp3")
        self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
        
        if audioPath == Bundle.main.path(forResource: "Song1", ofType: "mp3") {
            labelSongName.text = "Черный бумер"
            labelNameSong1.text = "Черный бумер"
            labelNameSinger.text = "Серега"
            imageSong.image = UIImage(named: "bumer")
            timeSong = 244
        }
        
        if audioPath == Bundle.main.path(forResource: "Song2", ofType: "mp3") {
            labelSongName.text = "Relax"
            labelNameSong1.text = "Relax"
            labelNameSinger.text = "Jazz"
            imageSong.image = UIImage(named: "jazz")
            timeSong = 210
            
        }
        
        self.player.play()
        self.player.volume = sliderVolume.value
        
    }
    
    
    @IBAction func nextSongButton(_ sender: Any) {
    if self.count < 2 {
        self.count += 1
    } else {
        self.count = 1
    }
    
    let audioPath = Bundle.main.path(forResource: "Song\(self.count)", ofType: "mp3")
    self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
    
    if audioPath == Bundle.main.path(forResource: "Song1", ofType: "mp3") {
        labelSongName.text = "Черный бумер"
        labelNameSong1.text = "Черный бумер"
        labelNameSinger.text = "Серега"
        imageSong.image = UIImage(named: "bumer")
        timeSong = 244
    }
    
    if audioPath == Bundle.main.path(forResource: "Song2", ofType: "mp3") {
        labelSongName.text = "Relax"
        labelNameSong1.text = "Relax"
        labelNameSinger.text = "Jazz"
        imageSong.image = UIImage(named: "jazz")
        timeSong = 210
        
    }
    
    self.player.play()
    self.player.volume = sliderVolume.value
    
    }
    
    @IBAction func hideButton(_ sender: Any) {
        player.stop()
        dismiss(animated: true, completion: nil)
    }
    

}
