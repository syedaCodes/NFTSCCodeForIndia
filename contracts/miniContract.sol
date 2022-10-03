//2.
//ERC721 - Ethereum's Request for Comment is a smart contract - NFT created with ERC721 are unique and have unique ids 
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

//Ownable - we use a function from here to make sure only the owner of that smart contract can access it
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

//1. 
pragma solidity >=0.4.16 < 0.9.0; //pragma solidity makes sure the version of your contract (packages/dependencies) is maintained

contract mintContract is ERC721URIStorage, Ownable{
    //contract code
    using Counters for Counters.Counter; //counters to create unique ids

    Counters.Counter private tokenId; //by default the value will be 0

    constructor() ERC721("MyNFT", "NFT"){

    }

    //function to mint the NFT
    function mintNFT(string memory tokenURI) public onlyOwner returns(uint256){

        tokenId.increment(); //increments the id

        //assign id to uint newId
        uint256 newId = tokenId.current();

        // _mint is a function - takes two params

        _mint(msg.sender, newId); //msg.sender will have the mint address

        _setTokenURI(newId, tokenURI); 

        return newId;

        //ref node_modules\@openzeppelin\contracts\token\ERC721\ERC721.sol openzeppelin does it for you

    }
}