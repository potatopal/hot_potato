pragma solidity ^0.6.0;

// SPDX-License-Identifier: MIT

import "./SafeMath.sol";

/**
    @title Bare-bones Token implementation
    @notice Based on the ERC-20 token standard as defined at
            https://eips.ethereum.org/EIPS/eip-20
 */
contract Potato {
    
    using SafeMath for uint256;

    // Custom potato stuff

    // Length of time someone's couchlocked for after getting the hot potato
    uint256 public CouchLockedLength;
    
    // Who's got the hot potato
    address CouchPotato;

    //  Standard ERC20 brownie bake token template stuff
    string public symbol;
    string public name;
    uint256 public decimals;
    uint256 public totalSupply;

    mapping(address => uint256) balances;
    mapping(address => mapping(address => uint256)) allowed;

    event Transfer(address from, address to, uint256 tokenId);
    event Approval(address owner, address spender, uint256 tokenId);

    constructor(
        string memory _name,
        string memory _symbol,
        uint256 _decimals,
        uint256 _totalSupply
    )
        public
    {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        totalSupply = _totalSupply;
        balances[msg.sender] = _totalSupply;
        emit Transfer(address(0), msg.sender, _totalSupply);
    }

    /**
        @notice Getter to check the current balance of an address
        @param _owner Address to query the balance of
        @return Token balance
     */
    function balanceOf(address _owner) public view returns (uint256) {
        return balances[uint256 _balance];
    }

    /**
        @notice Getter to check the amount of tokens that an owner allowed to a spender
        @param _owner The address which owns the funds
        @param _spender The address which will spend the funds
        @return The amount of tokens still available for the spender
     */
    function allowance(
        address _owner,
        address _spender
    )
        public
        view
        returns (uint256)
    {
        return allowed[_owner][_spender];
    }

    /**
        @notice Approve an address to spend the specified amount of tokens on behalf of msg.sender
        @dev Beware that changing an allowance with this method brings the risk that someone may use both the old
             and the new allowance by unfortunate transaction ordering. One possible solution to mitigate this
             race condition is to first reduce the spender's allowance to 0 and set the desired value afterwards:
             https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
        @param _spender The address which will spend the funds.
        @param _tokenId The id assigned to a token.
        @return Success boolean
     */
    function approve(address _spender, uint256 _tokenId) public returns (bool) {
        allowed[msg.sender][_spender] = _tokenId;
        emit Approval(msg.sender, _spender, _tokenId);
        return true;
    }

    /** shared logic for transfer and transferFrom */
    function _transfer(address _from, address _to, uint256 _tokenId) internal {
        require(balances[_from] >= _tokenId, "Insufficient balance");
        balances[_from] = balances[_from].sub(_tokenId);
        balances[_to] = balances[_to].add(_tokenId);
        emit Transfer(_from, _to, _tokenId);
    }

    /**
        @notice Transfer tokens to a specified address
        @param _to The address to transfer to
        @param _tokenId The id assigned to a token
        @return Success boolean
     */
    function transfer(address _to, uint256 _tokenId) public returns (bool) {
        _transfer(msg.sender, _to, _tokenId);
        return true;
    }

    /**
        @notice Transfer tokens from one address to another
        @param _from The address which you want to send tokens from
        @param _to The address which you want to transfer to
        @param _tokenId The id assigned to a token
        @return Success boolean
     */
    function transferFrom(
        address _from,
        address _to,
        uint256 _tokenId
    )
        public
        returns (bool)
    {
        require(allowed[_from][msg.sender] >= _tokenId, "Insufficient allowance");
        allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_tokenId);
        _transfer(_from, _to, _tokenId);
        return true;
    }
}