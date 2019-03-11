//
//  BookDetailViewController.swift
//  Book Search App
//
//  Created by MAC Consultant on 3/10/19.
//  Copyright © 2019 MAC Consultant. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {

    @IBOutlet weak var detailsView: UITextView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bookImage: UIImageView!
    
    var bookTitle: String?
    var name: String?
    var desc: String?
    var image: UIImage? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = bookTitle
        authorLabel.text = name
        detailsView.text = desc
    // Do any additional setup after loading the view.
    }
    
}
