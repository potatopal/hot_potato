// SPDX-License-Identifier: MIT
// pragma solidity ^0.6.0;

// // Importing OpenZepplin contracts from Potato_flat.sol - for dev for now
// import 'Potato_flat.sol';

// // Remix import syntax
// // import "github/OpenZeppelin/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
// // import "github/OpenZeppelin/openzeppelin-contracts/contracts/token/ERC721/ERC721Burnable.sol";
// // import "github/OpenZeppelin/openzeppelin-contracts/contracts/access/Ownable.sol";

// contract Potato is ERC721, Ownable, ERC721Burnable {
//     constructor() ERC721("Potato", "HOT") public {}

//     function mint(address to, uint256 tokenId) public onlyOwner {
//         _mint(to, tokenId);
//     }

//     function _mint(address to) public onlyOwner{
//         mint(to, totalSupply().add(1));
//     }

// }