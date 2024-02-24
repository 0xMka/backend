// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TokenFactory {
    event TokenCreated(address indexed tokenAddress, string name, string symbol, uint256 initialSupply);

    function createToken(string memory name, string memory symbol, uint256 initialSupply) external {
        // Convertir le montant initial en termes d'unités atomiques (wei)
        uint256 initialSupplyInWei = initialSupply * (10 ** 18);
        MyToken newToken = new MyToken(msg.sender, name, symbol, initialSupplyInWei);
        emit TokenCreated(address(newToken), name, symbol, initialSupply);
    }
}

contract MyToken is ERC20 {
    constructor(address initialOwner, string memory name, string memory symbol, uint256 initialSupply) ERC20(name, symbol) {
        _mint(initialOwner, initialSupply);
    }
}
