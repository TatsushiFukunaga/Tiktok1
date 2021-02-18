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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    func refleshData() {
        if searchTextField.text?.isEmpty != nil {
            let urlString = "https://itunes.apple.com/search?term=\(String(describing: searchTextField.text!))&entity=song&country=jp"
            let encodeUrlString:String = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
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
