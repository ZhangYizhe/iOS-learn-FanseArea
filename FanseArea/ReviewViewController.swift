//
//  ReviewViewController.swift
//  FanseArea
//
//  Created by 张艺哲 on 2017/7/19.
//  Copyright © 2017年 张艺哲. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    var rating:String?

    @IBOutlet weak var bgImageView: UIImageView!
    
    @IBOutlet weak var ratingStackView: UIStackView!
    
    @IBAction func ratingType(_ sender: UIButton) {
        switch sender.tag {
        case 100:
            rating = "dislike"
        case 101:
            rating = "good"
        case 102:
            rating = "great"
        default:
            break
        }
        
        performSegue(withIdentifier: "unwindToDetailView", sender: self)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //背景虚化
        
        
        
        let effect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect : effect)
        blurEffectView.frame = view.frame
        
        bgImageView.addSubview(blurEffectView)
        
        //ratingStackView.transform = CGAffineTransform(scaleX: 0, y: 0)
        
        let startScale = CGAffineTransform(scaleX: 0, y: 0)
        let startPos = CGAffineTransform(translationX: 0, y: -500)

        
        ratingStackView.transform = startScale.concatenating(startPos)
 
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
//        UIView.animate(withDuration: 0.3) { 
//           self.ratingStackView.transform = CGAffineTransform.identity
//        }
        
        //震荡效果
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
            
            let endPos = CGAffineTransform(translationX: 0, y: 0)
            let endScale = CGAffineTransform.identity
            
            self.ratingStackView.transform = endPos.concatenating(endScale)
            
            //self.ratingStackView.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
