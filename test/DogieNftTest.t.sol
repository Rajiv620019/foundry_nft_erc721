// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {DeployDogieNft} from "../script/DeployDogieNft.s.sol";
import {DogieNft} from "../src/DogieNft.sol";
import {Test, console} from "forge-std/Test.sol";
import {StdCheats} from "forge-std/StdCheats.sol";

contract DogieNftTest is Test {
    string constant NFT_NAME = "Dogie";
    string constant NFT_SYMBOL = "DOG";
    DogieNft public basicNft;
    DeployDogieNft public deployer;
    address public deployerAddress;

    string public constant PUG_URI =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";
    address public constant USER = address(1);

    function setUp() public {
        deployer = new DeployDogieNft();
        basicNft = deployer.run();
    }

    function testInitializedCorrectly() public view {
        assert(keccak256(abi.encodePacked(basicNft.name())) == keccak256(abi.encodePacked((NFT_NAME))));
        assert(keccak256(abi.encodePacked(basicNft.symbol())) == keccak256(abi.encodePacked((NFT_SYMBOL))));
    }

    function testCanMintAndHaveABalance() public {
        vm.prank(USER);
        basicNft.mintNft(PUG_URI);

        assert(basicNft.balanceOf(USER) == 1);
    }
}
