//
//  PostsAndCommentsTests.swift
//  PostsAndCommentsTests
//
//  Created by AftabAhmed on 04/08/22.
//

import XCTest
@testable import PostsAndComments

class PostsAndCommentsTests: XCTestCase {

    var sut: PostViewModel!
    
    var mockPosts = [
        Post(id: 1, title: "Post1"),
        Post(id: 2, title: "Post2"),
        Post(id: 3, title: "Post3"),
        Post(id: 4, title: "Post4"),
        Post(id: 5, title: "Post5")
    ]
    
    var mockComments = [
        Comment(id: 1, body: "Comment1", postId: 2),
        Comment(id: 2, body: "Comment1", postId: 2),
        Comment(id: 3, body: "Comment1", postId: 3),
        Comment(id: 4, body: "Comment1", postId: 4),
        Comment(id: 5, body: "Comment1", postId: 4),
    ]
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        
        sut = PostViewModel()
        sut.postHelper.posts = mockPosts
        sut.commentHelper.comments = mockComments
        
    }
    
    func testSearchPostsForSearchText() {
        testForSearchText("P", 5)
        testForSearchText("1", 1)
    }
    
    func testFetchCommentsForPost() {
        testForCommentsForPostId(4, 2)
        testForCommentsForPostId(5, 0)
        testForCommentsForPostId(2, 2)
        testForCommentsForPostId(1, 0)
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        try super.tearDownWithError()
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}

extension PostsAndCommentsTests {
    //Test Helpers
    private func testForSearchText(_ text: String, _ testResult: Int) {
        let searchPosts = sut.searchPostsFor(text)
        XCTAssertTrue(searchPosts.count == testResult, "The count of the posts returned for the search text \"\(text)\" ")
    }
    
    private func testForCommentsForPostId(_ postId: Int, _ testResult: Int) {
        let comments = sut.commentsFor(postId)
        XCTAssertTrue(comments.count == testResult, "The count of the comments returned for the post id \(postId)")
    }
}
