## Cấu trúc của 1 function
```bash
function functionName(
    // Các tham số đầu vào
    uint256 param1, 
    address param2, 
    string memory param3
) 
    // Modifier
    public          // Phạm vi truy cập 
    payable         // Có thể nhận ETH
    whenNotPaused   // Custom modifier
    returns (       // Giá trị trả về
        uint256,    // Kiểu dữ liệu trả về
        bool        // Nhiều giá trị
    )
{
    // Phần thân function
    
    // Kiểm tra điều kiện
    require(param1 > 0, "Invalid parameter");
    
    // Logic xử lý
    uint256 result = param1 * 2;
    bool status = true;
    
    // Trả về giá trị
    return (result, status);
}
```
