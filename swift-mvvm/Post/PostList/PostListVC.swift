//
//  PostListVC.swift
//  swift-mvvm
//
//  Created by 남오승 on 2021/07/15.
//

import UIKit
import RxCocoa
import RxSwift

//포스트 리스트 전용 ViewController
class PostListVC: BaseVC {
    
    /* 실질적으로 이벤트 처리에 직접적으로 사용할 View 요소만 변수 세팅 */

    var postListTV: UITableView!
    var refreshCtrl: UIRefreshControl!
    
    /* */
    
    private var viewModel = PostListViewModel()
    
    func setupCalls() {
        viewModel
            .input
            .postList
            .accept(true)
    }
    
    func setupBinds() {
        //포스트 리스트 바인딩
        viewModel
            .output
            .postList
            .bind(to: postListTV.rx.items) { (tableView: UITableView, index: Int, element: PostRPModel) -> PostListTableViewCell in
                let cell: PostListTableViewCell = tableView.dequeueReusableCell(withIdentifier: "PostListTableViewCell") as! PostListTableViewCell
                cell.dataBind(element)
                return cell
            }.disposed(by: disposeBag)
    }
    
    func setupEvents() {
        //포스트 리스트 Cell클릭 이벤트
        postListTV.rx.modelSelected(PostRPModel.self)
            .map{$0.id}
            .subscribe(onNext:{[weak self] result in
                self?.postDetailMove(postId: result)
            }).disposed(by: disposeBag)
    }
    
    //포스트 상세화면 이동
    func postDetailMove(postId: Int) {
        let postDetailVC = PostDetailVC()
        postDetailVC.postId = postId
        postDetailVC.modalTransitionStyle = .coverVertical
        postDetailVC.modalPresentationStyle = .fullScreen
        present(postDetailVC, animated: true, completion: nil)
    }
}
