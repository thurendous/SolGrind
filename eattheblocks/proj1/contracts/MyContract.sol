pragma solidity ^0.5.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20Detailed.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20Burnable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20Mintable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20Capped.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20Pausable.sol";

contract MyToken is ERC20, ERC20Detailed, ERC20Burnable, ERC20Mintable, ERC20Capped, ERC20Pausable {
    constructor() ERC20Detailed("MyTOken",   MTN", 18) ERC20Capped(1000);

    pause()
    unpause()
    paused()

    addPauser(0x.....)

}
