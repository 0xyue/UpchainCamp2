// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "../node_modules/solmate/src/tokens/ERC721.sol";
import "../node_modules/solmate/src/auth/Owned.sol";

contract YueNFT is ERC721 {
    uint256 private _tokenid;

    constructor() ERC721("YueNFT", "YueNFT") {
        _tokenid = 0;
    }

    function mint() public {
        _safeMint(msg.sender, _tokenid);
        _tokenid++;
    }

    function tokenURI(
        uint256 tokenid_
    ) public view virtual override returns (string memory) {
        require(_ownerOf[tokenid_] != address(0), "Invalid token");
        return "ipfs://QmRjqTDvihApmfxphej3vaQmb3ds14YbQ3hYnaQEKHzJYT";
    }
}
