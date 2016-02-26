//
//  ViewController.swift
//  CustomAVPlayerVC
//
//  Created by Eliza Sapir on 26/02/2016.
//  Copyright © 2016 Kaltura. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
    let playerVC = AVPlayerViewController()
    let playPauseBtn:UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let url = NSURL(string: "http://www.sample-videos.com/video/mp4/720/big_buck_bunny_720p_1mb.mp4")
        
        playerVC.player = AVPlayer(URL: url!)
        self.addChildViewController(playerVC)
        self.view.addSubview(playerVC.view)
        playerVC.view.frame = self.view.frame
        playPauseBtn.frame =  CGRectMake(50, (self.view.frame.height - 150), 100, 50)
        playPauseBtn.backgroundColor = UIColor.greenColor()
        playPauseBtn.setTitle("Play", forState: UIControlState.Normal)
        playPauseBtn.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        playPauseBtn.tag = 22;
        self.view.addSubview(playPauseBtn)
        self.view.bringSubviewToFront(playPauseBtn)
    }
    
    func buttonAction(sender:UIButton!) {
        if( playerVC.player?.rate != 0) {//is playing
            playerVC.player?.pause()
            playPauseBtn.setTitle("Play", forState: UIControlState.Normal)
        } else {
            playerVC.player?.play()
            playPauseBtn.setTitle("Pause", forState: UIControlState.Normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

