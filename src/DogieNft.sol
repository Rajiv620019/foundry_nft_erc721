// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract DogieNft is ERC721 {
    constructor() ERC721("Dogie", "DOG") {}
}
