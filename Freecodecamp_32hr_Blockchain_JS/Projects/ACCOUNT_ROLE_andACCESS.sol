//SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

//manage roles assigned to accounts
//as per the role they can access some funcs and can be restricted for some

contract AccessControl{
    //mapping from role => Accounts => bool
    //for ex : ADMIN => Alice's address => true

    mapping(bytes32 => mapping(address => bool)) public roles;
    //roles is bytes32 coz we r gonna hash the name of the role, so even if its a long string it still hashes to bytes32 : saves gas
    
    //defining 2 roles : ADMIN and USER

    bytes32 private constant ADMIN = keccak256(abi.encodePacked("ADMIN"));
    //roles is private coz its hash can be computed off-chain as well so no need to make it public and use more gas
    //private means variable cannot be modified outside that particular scope and we only need its hash which will be anyways computed off-chain
    //constant variables are named in all uppercase

    bytes32 private constant USER = keccak256(abi.encodePacked("USER"));
    
    //making them public so that we can compute their hash on-chain for now..otherwise it'll happen off-chain
    //bytes32 public constant ADMIN = keccak256(abi.encodePacked("ADMIN")); 
    //0xdf8b4c520ffe197c5343c6f5aec59570151ef9a492f2c624fd45ddde6135ec42
    //bytes32 public constant USER = keccak256(abi.encodePacked("USER")); 
    //0x2db9fd3d099848027c2383d0a083396f6c41510d7acfd92adc99b6cffcf31e96
    //making them back private after calculating hash


    //indexed event so that we can easily filter on the basis of role or account
    event Grantrole(bytes32 indexed role, address indexed account);
    event Revokerole(bytes32 indexed role, address indexed account);

    //modifier to ensure "only if msg.sender has the input _role can the function be executed further otherwise not"
    //in this case input _role will be admin i.e. only if msg.sender is ADMIN, the rest of the function will be executed
    modifier onlyAdmin(bytes32 _role){
        require(roles[_role][msg.sender], "Unauthorized");
        _;
    }
    

    constructor() {
        _grantrole(ADMIN, msg.sender);
    }

    //function to grant role to an account
    //first we will define internal function grant role and later external grant role which 
    //users can use. THis one will be called by the external grantrole function. 
    //We r making this internal and nt private so that it can be accessed by the child contracts
    function _grantrole(bytes32 _role, address _account) internal  {
        roles[_role][_account] = true;
        //this role for this account is granted        
        emit Grantrole(_role, _account);
    }

    //now external version of grantrole function which can only be accessed by the ADMIN to grant roles
    function grantrole(bytes32 _role, address _account) external onlyAdmin(ADMIN) {
        _grantrole(_role, _account); //calling the internal version
        //now since no one is the ADMIN ryt now, no one can access this function
        //so we will create a constructor to assign the role of ADMIN to the deployer 
    }

    //function to take awy roles from certain accounts .... only ADMIN can access it
    function revokerole(bytes32 _role, address _account) external onlyAdmin(ADMIN) {
        roles[_role][_account] = false;
        //this role for this account is granted        
        emit Revokerole(_role, _account);
    }

    //the account which deployed this is 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
    //admin hash is 0xdf8b4c520ffe197c5343c6f5aec59570151ef9a492f2c624fd45ddde6135ec42
    //putting both in roles and if true comes then deployer has been assigned ADMIN via constructor
    //now put in USER hash and other address in grantrole and give USER role to some address, revoke the role then, keep verifying in roles
}
