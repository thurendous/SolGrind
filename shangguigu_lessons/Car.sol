pragma solidity >0.4.22;

contract Car {
    string brand; // can use bytes32 to define this brand. for convenience we selected string here.
    uint256 public price;

    constructor(string initBrand, uint256 initPrice) public {
        // set brand and price when initiate
        brand = initBrand;
        price = initPrice;
    }

    function setBrand(string newBrand) public {
        brand = newBrand;
    }

    function getBrand() public view returns (string) {
        return brand;
    }

    function setPrice(uint256 newPrice) public {
        price = newPrice;
    }
}
