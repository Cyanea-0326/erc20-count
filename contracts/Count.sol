// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Count {
    string public name;
    string public symbol;
    uint8 public decimals = 18;
    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    constructor(string memory _name, string memory _symbol, uint256 _totalSupply){
        name = _name;
        symbol = _symbol;
        totalSupply = _totalSupply;
        balanceOf[msg.sender] = totalSupply;
    }

    // function balanceOf(address _owner) external view returns (uint256){
    //     return balances[_owner];
    // }

    // function allowance(address _owner, address _spender) public view returns (uint256){
    //     return allowances[_owner][_spender];
    // }

    function transfer(address _to, uint256 _value) external returns (bool){
        _transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) external returns (bool){
        require(allowance[_from][msg.sender] >= _value, "Transfer amount exceeds allowance");
        _transfer(_from, _to, _value);
        allowance[_from][msg.sender] -= _value;
        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool success){
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function _transfer(address _from, address _to, uint256 _value) private {
        require(_value <= balanceOf[_from], "Insufficient balance");
        require(_from != _to, "from = to");
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(_from, _to, _value);
    }

    /* totalCount */
    mapping(address => uint256) public totalCount;

    function totalCounter(address) external view returns (uint256){
    return totalCount[msg.sender];
    }
}