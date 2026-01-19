//
//  FeedViewController.swift
//  Instagram
//
//  Created by Abduraxmon Davurov on 19/01/26.
//

import UIKit
import SnapKit

class FeedViewController: UIViewController {
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialise()
    }
    
    //MARK: - Private Properties
    private let tableView = UITableView()
    private let items: [FeedItemType] = [
        .stories(
            [
                FeedStoriesItemCellInfo(
                    image: UIImage(named: "Dog")!,
                    username: "Abduraxmon",
                    isAddButtonVisible: true,
                    isNewStory: false),
                FeedStoriesItemCellInfo(
                    image: UIImage(named: "Dog")!,
                    username: "Abduraxmon",
                    isAddButtonVisible: false,
                    isNewStory: true),
                FeedStoriesItemCellInfo(
                    image: UIImage(named: "Dog")!,
                    username: "Abduraxmon",
                    isAddButtonVisible: false,
                    isNewStory: true),
            ]
        )
    ]
}

private extension FeedViewController {
    
    func initialise() {
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItems = makeLeftBarButtonItems()
        navigationItem.rightBarButtonItems = makeRightBarButtonItems()
        tableView.dataSource = self
        tableView.register(FeedPostSetCell.self, forCellReuseIdentifier: String(describing: FeedPostSetCell.self))
        tableView.register(FeedStoriesSetCell.self, forCellReuseIdentifier: String(describing: FeedStoriesSetCell.self))
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func makeLeftBarButtonItems() -> [UIBarButtonItem] {
        let logoBarButtonItem = UIBarButtonItem(customView: LogoView())
        let dropDownButtonItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "chevron.down"), target: self, action: nil, menu: makeDropDownMenu())
        dropDownButtonItem.tintColor = .black
        
        return [logoBarButtonItem, dropDownButtonItem]
    }
    
    func makeRightBarButtonItems() -> [UIBarButtonItem] {
        let addBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.app"), style: .plain, target: self, action: #selector(didTapPlusButton))
        let directBarbuttonItem = UIBarButtonItem(image: UIImage(systemName: "paperplane"), style: .plain, target: self, action: #selector(didTapDirectButton))
        return [addBarButtonItem, directBarbuttonItem]
    }
    
    @objc func didTapPlusButton() {
        print("Plus button tapped")
    }
    
    @objc func didTapDirectButton() {
        print("Direct button tapped")
    }
    
    
    func makeDropDownMenu() -> UIMenu {
        let subsItem = UIAction(title: "Following", image: UIImage(systemName: "person.2")) { _ in
            print("Subs")
        }
        let favsItem = UIAction(title: "Favourites", image: UIImage(systemName: "star")) { _ in
            print("Favourites")
        }
        
        return UIMenu(title: "", children: [subsItem, favsItem])
    }
    
}

extension FeedViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        
        switch item {
        case .posts(let post):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedPostSetCell.self), for: indexPath) as! FeedPostSetCell
            cell.configure(with: post)
            return cell
        case .stories(let story):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedStoriesSetCell.self), for: indexPath) as! FeedStoriesSetCell
            cell.configure(with: story)
            return cell
        }
        
    }
    
    
}


#Preview {
    let vc = FeedViewController()
    return vc
}
