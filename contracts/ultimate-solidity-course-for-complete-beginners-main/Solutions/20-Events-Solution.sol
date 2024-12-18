// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


// event tưởng tượng giống event trong java
contract EventExample {
    // 1️⃣ Add an event called "NewUserRegistered" with 2 arguments
    // 👉 user as address type
    // 👉 username as string type
    // CODE HERE 👇
    // cấu trúc tương tụ record trong java

    // Cơ chế của event là hàm sẽ bắn event và smart contract sẽ bắt event và gọi hàm listener để thực thi
    //Tối đa 3 tham số được đánh dấu indexed
    //Giúp tra cứu nhanh các event
    //Giảm chi phí lưu trữ
    event NewUserRegistered(address indexed user, string username);
    
    struct User {
        string username;
        uint256 age;
    }
    
    mapping(address => User) public users;
    
    function registerUsers(string memory _username, uint256 _age) public {
        User storage newUser = users[msg.sender];
        newUser.username = _username;
        newUser.age = _age;
        
        // 2️⃣ Emit the event with msg.sender and username as the inputs
        // CODE HERE 👇
        // Phát ra 1 event
        emit NewUserRegistered(msg.sender, _username);
    }
}
