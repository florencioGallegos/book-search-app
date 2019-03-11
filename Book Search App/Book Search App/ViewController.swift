//
//  ViewController.swift
//  Book Search App
//
//  Created by MAC Consultant on 3/9/19.
//  Copyright © 2019 MAC Consultant. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    

    @IBOutlet weak var bookCollectionView: UICollectionView!
    
    static var books  = [bookObject]()
    var name = ""
    var descrip = ""
    var bookTitle = "php"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        bookCollectionView.delegate = self
        bookCollectionView.dataSource = self
        bookCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier:"Imagecell")
        downloadJSON()
    }
    
    func downloadJSON()
    {
        guard let requestUrl = URL(string: "https://www.googleapis.com/books/v1/volumes?q=\(bookTitle)&key=AIzaSyCgLQWnhb4QRCn7VqqqZ8H7EKSYgXr6OOY") else
        { return }
        URLSession.shared.dataTask(with: requestUrl) {data, urLResponse, error in
            guard let data = data, error == nil, urLResponse != nil else
            {
                print("Something is wrong with the download")
                return
            }
            do
            {
                let decoder = JSONDecoder()
                let downloadedbooks = try decoder.decode(bookObjects.self, from: data)
                ViewController.books = downloadedbooks.items
                DispatchQueue.main.async
                    {
                        self.bookCollectionView.reloadData()
                }
            } catch
            {
                print("something is wrong with the JSON file")
            }
            }.resume()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ViewController.books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
       
        if let imageURL = URL(string: ViewController.books[indexPath.row].volumeInfo.imageLinks.smallThumbnail)
        {
            print("image")
            URLSession.shared.dataTask(with: imageURL) { (data, _, _) in
            if let dat = data {
                let image = UIImage(data: dat)
                DispatchQueue.main.async
                    {
                        cell.bookImage.image = image
                    }
                }
            }.resume()
        }
         print ("here")
        cell.titleLabel.text = ViewController.books[indexPath.item].volumeInfo.title
        cell.authorLabel.text = ViewController.books[indexPath.item].volumeInfo.authors[0]
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("here1")
        func prepare(for segue: UIStoryboardSegue, sender: Any?)
        {
            print("here2")
            let vc = segue.destination as! BookDetailViewController
            vc.name = ViewController.books[indexPath.item].volumeInfo.authors[0]
            vc.bookTitle = ViewController.books[indexPath.item].volumeInfo.title
            vc.desc = ViewController.books[indexPath.item].volumeInfo.description
        }
        performSegue(withIdentifier: "showBook", sender: self)
   //                       sender: toys[indexPath.row])
        print(indexPath.item)
    }
}
