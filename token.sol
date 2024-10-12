// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Pelumi is ERC20 {
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can mint");
        _;
    }

    constructor() ERC20("Pelumi", "PLM") {
        owner = msg.sender;
    }

    function mint(address _to, uint256 _amount) public onlyOwner {
        _mint(_to, _amount);
    }

    function burn(uint256 _amount) public {
        _burn(msg.sender, _amount);
    }

    function transfer(address to, uint256 value) public virtual override returns (bool success) {
        require(balanceOf(msg.sender) >= value, "Insufficient balance");
        success = super.transfer(to, value);
    }

}