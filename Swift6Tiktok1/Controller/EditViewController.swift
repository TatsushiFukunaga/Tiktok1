//
//  EditViewViewController.swift
//  Swift6Tiktok1
//
//  Created by Tatsushi Fukunaga on 2021/02/17.
//

import UIKit
import AVKit

class EditViewController: UIViewController {

    var url:URL?
    var playerController:AVPlayerViewController?
    var player:AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setUPVideoPlayer(url: url!)
    }
    
    func setUPVideoPlayer(url:URL) {
        
        playerController?.removeFromParent()
        player = nil
        
        view.backgroundColor = .black
        
        playerController = AVPlayerViewController()
        playerController?.videoGravity = .resizeAspectFill
        playerController?.view.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height - 100)
        playerController?.showsPlaybackControls = false
        playerController?.player = player!
        self.addChild(playerController!)
        self.view.addSubview((playerController?.view)!)
        
        player?.play()
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
