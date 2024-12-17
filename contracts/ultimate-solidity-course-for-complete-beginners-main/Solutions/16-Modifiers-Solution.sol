// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PausableToken {
    // Địa chỉ chủ sở hữu hợp đồng
    address public owner;

    // Trạng thái tạm dừng hoạt động của hợp đồng
    bool public paused;

    // Ánh xạ số dư token của từng địa chỉ
    mapping(address => uint) public balances;

    // Constructor được gọi duy nhất khi hợp đồng được triển khai
    constructor() {
        // Gán địa chỉ người triển khai làm chủ sở hữu
        // Người deploy contract
        owner = msg.sender;

        // Đặt trạng thái ban đầu là hoạt động (không bị tạm dừng)
        paused = false;

        // Cấp 1000 token cho chủ sở hữu ban đầu
        balances[owner] = 1000;
    }

    // Modifier chỉ cho phép chủ sở hữu thực thi
    modifier onlyOwner() {
        // Kiểm tra xem người gọi có phải chủ sở hữu không
        require(msg.sender == owner, "Only owner can perform this action");
        // Cho phép thực thi hàm nếu điều kiện đúng
        _;
    }

    // Modifier kiểm tra hợp đồng chưa bị tạm dừng
    modifier notPaused() {
        // Kiểm tra trạng thái hoạt động của hợp đồng
        require(!paused, "Contract is paused");
        // Cho phép thực thi hàm nếu chưa bị tạm dừng
        _;
    }

    // Hàm tạm dừng hợp đồng (chỉ chủ sở hữu được phép)
    function pause() public onlyOwner {
        // Đặt trạng thái thành bị tạm dừng
        paused = true;
    }

    // Hàm tiếp tục hoạt động hợp đồng (chỉ chủ sở hữu được phép)
    function unpause() public onlyOwner {
        // Đặt trạng thái thành hoạt động
        paused = false;
    }

    // Hàm chuyển token giữa các địa chỉ
    function transfer(address to, uint amount) public notPaused {
        // Kiểm tra số dư đủ để chuyển
        require(balances[msg.sender] >= amount, "Insufficient balance");

        // Trừ số token từ địa chỉ gửi
        balances[msg.sender] -= amount;
        // Cộng số token vào địa chỉ nhận
        balances[to] += amount;
    }
}