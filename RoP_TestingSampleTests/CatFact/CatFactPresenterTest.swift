//
//  CatFactPresenterTest.swift
//  RoP_TestingSampleTests
//
//  Created by Rohit Pradhan on 09/08/21.
//

import XCTest
@testable import RoP_TestingSample

class CatFactPresenterTest: XCTestCase {

    let catFactUseCaseStub = CatFactUseCaseStub()
    let catFactViewRouterStub = CatFactViewRouterStub()
    let catFactViewSpy = CatFactViewSpy()

    var catFactPresenter: CatFactPresenterImplementation!


    override func setUp() {
        super.setUp()
        catFactPresenter = CatFactPresenterImplementation(view: catFactViewSpy, router: catFactViewRouterStub, useCase: catFactUseCaseStub)
    }

    func testViewDidLoad_api() {
        catFactPresenter.viewDidLoad()
        XCTAssertTrue(catFactUseCaseStub.getFactCalled, "API is not called")
    }

    func testViewDidLoad_response_string() {
        catFactPresenter.viewDidLoad()
        XCTAssertEqual(catFactViewSpy.newFactText, "Here is a new fact", "Incorrect string passed to view")
    }

    func testViewDidLoad_view_connection() {
        catFactPresenter.viewDidLoad()
        XCTAssertTrue(catFactViewSpy.setNewFactCalled, "View method is not called")
    }

}


class CatFactUseCaseStub: CatFactUseCase {
    var getFactCalled = false

    func getCatFact(completionHandler: @escaping CatFactUseCaseCompletionHandler) {
        let fact = Fact(fact: "Here is a new fact", lenght: 22)
        getFactCalled = true
        completionHandler(.success(fact))
    }
}


class CatFactViewRouterStub: CatFactViewRouter {

}

class CatFactViewSpy: CatFactView {
    var setNewFactCalled = false
    var newFactText = ""

    func setNewFact(text: String) {
        setNewFactCalled = true
        newFactText = text
    }

}
