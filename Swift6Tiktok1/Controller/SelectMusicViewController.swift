//
//  SelectMusicViewController.swift
//  Swift6Tiktok1
//
//  Created by Tatsushi Fukunaga on 2021/02/17.
//

import UIKit
import SDWebImage
import AVFoundation
import SwiftVideoGenerator

class SelectMusicViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    
    var musicModel = MusicModel()
    var player:AVAudioPlayer?
    var videoPath = String()
    var passedURL:URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        searchTextField.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicModel.artistNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.isHighlighted = false
        let artWorkImageView = cell.contentView.viewWithTag(1) as! UIImageView
        let musicNameLabel = cell.contentView.viewWithTag(2) as! UILabel
        let artistNameLabel = cell.contentView.viewWithTag(3) as! UILabel
        
        artWorkImageView.sd_setImage(with: URL(string: musicModel.artworkUrl100Array[indexPath.row]), completed: nil)
        musicNameLabel.text = musicModel.trackCensoredNameArray[indexPath.row]
        artistNameLabel.text = musicModel.artistNameArray[indexPath.row]
        
        let favButton = UIButton(frame: CGRect(x: 318, y: 41, width: 40, height: 33))
        favButton.setImage(UIImage(named: "fav"), for: .normal)
        favButton.addTarget(self, action: #selector(favButtonTap(_:)), for: .touchUpInside)
        favButton.tag = indexPath.row
        cell.contentView.addSubview(favButton)
        
        let playButton = UIButton(frame: CGRect(x: 20, y: 15, width: 100, height: 100))
        playButton.setImage(UIImage(named: "play"), for: .normal)
        playButton.addTarget(self, action: #selector(playButtonTap(_:)), for: .touchUpInside)
        playButton.tag = indexPath.row
        cell.contentView.addSubview(playButton)
        
        return cell
    }
    
    @objc func playButtonTap(_ sender: UIButton){
        
    }
    
    @objc func favButtonTap(_ sender: UIButton){
        
    }
    
    func refleshData() {
        if searchTextField.text?.isEmpty != nil {
            let urlString = "https://itunes.apple.com/search?term=\(String(describing: searchTextField.text!))&entity=song&country=jp"
            let encodeUrlString:String = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            musicModel.setData(resultCount: 50, encodeUrlString: encodeUrlString)
            searchTextField.resignFirstResponder()
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

}
