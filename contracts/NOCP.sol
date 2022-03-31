// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    
    Counters.Counter private _tokenIds;
    Counters.Counter private _itemsSold;

    constructor() ERC721("News NFT", "NewNFT"){}
    function mint(string memory _tokenURI) external returns(uint) {
        _tokenIds.increment();
        _safeMint(msg.sender, _tokenIds.current());
        _setTokenURI(_tokenIds.current(), _tokenURI);
        return(_tokenIds.current());
    }
}