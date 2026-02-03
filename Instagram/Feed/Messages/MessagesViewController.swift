//
//  MessagesViewController.swift
//  Instagram
//
//  Created by Abduraxmon Davurov on 21/01/26.
//

import UIKit


class MessagesViewController: UIViewController {
    //MARK: - Public
    var viewModel = MessageViewModel()
    weak var coordinator: MessageCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.hideTabbar = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.hideTabbar = false
    }
    //MARK: - Private
    private let tableView = UITableView()
    
    @objc private func backButtonTapped() {
        coordinator?.finish()
    }
}

private extension MessagesViewController {
    func initialize() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.tintColor = .black
        navigationItem.backButtonDisplayMode = .minimal
        navigationItem.leftBarButtonItems = makeLeftBarButtonItems()
        navigationItem.rightBarButtonItems = makeRightBarButtonItems()
        makeSearchBar()
        setTabBar(hidden: viewModel.hideTabbar)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MessageCell.self, forCellReuseIdentifier: String(describing: MessageCell.self))
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setTabBar(hidden: Bool, animated: Bool = true) {
        guard let tabBar = tabBarController?.tabBar else { return }
        
        let height = tabBar.frame.height
        let offset = hidden ? height : height * 2
        
        UIView.animate(withDuration: animated ? 0.3 : 0) {
            tabBar.frame = tabBar.frame.offsetBy(dx: 0, dy: offset)
        }
    }
    
    func makeLeftBarButtonItems() -> [UIBarButtonItem] {
        let backButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonTapped))
        let nameButtonItem = UIBarButtonItem(title: "Davurov", style: .plain, target: nil, action: nil)
        let dropDownButtonItem = UIBarButtonItem(title: nil, image: UIImage(named: "chevron"), target: self, action: nil, menu: makeDropDownMenu())
        dropDownButtonItem.tintColor = .black
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 20, weight: .semibold)
        ]
        nameButtonItem.setTitleTextAttributes(attributes, for: .normal)
        nameButtonItem.setTitleTextAttributes(attributes, for: .highlighted) // optional
        
        return [backButtonItem, nameButtonItem, dropDownButtonItem]
    }
    
    func makeRightBarButtonItems() -> [UIBarButtonItem] {
        let addBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "camera"), style: .plain, target: self, action: #selector(didTapReelButton))
        let directBarbuttonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(didTapDirectButton))
        return [directBarbuttonItem, addBarButtonItem]
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
    
    func makeSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false  // don’t darken view while searching
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.delegate = self // optional
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false // optional
    }
    
    @objc private func didTapReelButton() {}
    @objc private func didTapDirectButton() {}
}

extension MessagesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("User is typing: \(searchText)")
        // filter your data here
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        // perform search
    }
}

extension MessagesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MessageCell.self), for: indexPath) as! MessageCell
        cell.configure(with: viewModel.messages[indexPath.row])
        return cell
    }
}

extension MessagesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        coordinator?.showMessageDetail()
    }
}

#Preview {
    let vc = MessagesViewController()
    return vc
}
