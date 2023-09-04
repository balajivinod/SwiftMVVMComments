//
//  ViewController.swift
//  SwiftAPICall
//
//  Created by Balaji Duraisamy on 02/09/23.
//

import UIKit

class ViewController: UIViewController {

    private var viewModel: CommentsViewModel
    
    @IBOutlet weak var commentsTableView: UITableView!
    
    init(viewModel: CommentsViewModel = CommentsViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchComments { isCommentsFetched in
            if isCommentsFetched {
                self.commentsTableView.reloadData()
            }
        }
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let commentsCell = tableView.dequeueReusableCell(withIdentifier: "commentsCell") as? CommentsCell else {
            return UITableViewCell()
        }
        commentsCell.updateView(model: viewModel.comments[indexPath.row])
        return commentsCell
    }
}


