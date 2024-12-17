// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// 1. Create a Twitter Contract ✅
// 2. Create a mapping between user and tweet ✅
// 3. Add function to create a tweet and save it in mapping ✅
// 4. Create a function to get Tweet ✅
// 5. Add array of tweets ✅

contract Twitter {

    // add our code
    // Mapping: tương tự như map trong java cũng có dạng (ket, value)
    // hiện tại là 1 address được kết nối tới 1 mảng tweets
    mapping(address => string[] ) public tweets;

    // string chiềm nhiều bộ nhớ nên cần phỉa lấy từ memory để sử dụng
    function createTweet(string memory _tweet) public {
        tweets[msg.sender].push(_tweet);
    }

    // chỉ định kiểu trả về, string memory
    function getTweet(address _owner, uint _i) public view returns (string memory) {
        return tweets[_owner][_i];
    }

    function getAllTweets(address _owner) public view returns (string[] memory ){
        return tweets[_owner];
    }

}