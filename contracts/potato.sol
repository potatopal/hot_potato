pragma solidity ^0.6.0;

// SPDX-License-Identifier: MIT

import "./SafeMath.sol";

// Starter code from: https://github.com/alisyakainth/ERC721/blob/master/contract721.sol

contract Potato is ERC721 {
    
    using SafeMath for uint256;

	mapping(address => uint256) tokens;
	function approval(address _owner, address _approved, uint256 _tokenId){
		require(tokens[_owner] == _tokenId);
		tokens[_approved] = _tokenId;
	}
	function transfer(address _to, uint _amount) public payable{
		require(_amount <= tokens[msg.sender]);
		tokens[msg.sender] -= _amount;
		tokens[_to] += _amount;
	}
	function balanceOf(address _owner) public view returns (uint256){
		return balances[uint256 _balance];
	}
	function ownerOf(uint256 _tokenId) public view returns(address){
		return tokens[_id].address;
	}
	function TransferFrom(address _from, address _to, uint256 _tokenId) payable{
		require(tokens[_from] == _tokenId);
		tokens[_from] = 0;
		tokens[_to] = _tokenId;
	}
	function approve(address _approved, uint256 _tokenId) payable{
		require(tokens[msg.sender] == _tokenId);
		tokens[_approved] = _tokenId;
	}
	// function mint(address _to, uint265 _tokenId,) public{
	// 	tokens[_to] = 'mytoken '+str(uint(blockhash(block.number - 1)));
	// }
