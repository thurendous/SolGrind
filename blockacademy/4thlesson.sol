pragma solidity 0.8.4;

contract MyContract {
    struct Kitty {
        string name;
        address owner;
        uint256 id;
    }

    Kitty[] public kitties;
    mapping(address => uint256[]) ownerToKitty;

    function addKitty(string memory _name, address _owner) public {
        uint256 id = kitties.length;
        Kitty memory newKitty = Kitty(_name, _owner, id);
        kitties.push(newKitty);
        ownerToKitty[_owner].push(id);
    }

    function getKitty(address _owner) public view returns (string[] memory) {
        uint256 numOfKitties = ownerToKitty[_owner].length;
        string[] memory names = new string[](numOfKitties);
        for (uint256 i = 0; i < numOfKitties; i++) {
            uint256 id = ownerToKitty[_owner][i];
            names[i] = (kitties[id].name);
        }
        return names;
    }
}
