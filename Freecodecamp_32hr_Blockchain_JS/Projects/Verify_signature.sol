// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

//https://www.naukri.com/learning/articles/digital-signing-in-blockchain/#:~:text=sender%20sends%20it.-,Digital%20Signing%20in%20Blockchain%20is%20a%20process%20to%20verify%20the,can%20easily%20decrypt%20the%20document.
//Digital signature ensures that the receiver received the msg from the said sender 
//Also, they ensure that the message was not tampered along the way
/*4 steps : 
1) Message
2) Hash(message)
3) Sign(Encrypt Hash(message) using our private key) (Happens off-chain like in wallets)
4) ecrecover(hash(message), signature) == signer*/

contract VerifySignature{
    function verify(string memory _message, bytes memory _sig, address _signer) external pure returns(bool){
        //if the signature is valid and the signer returned by ecrecover
        //is equal to _signer in the input then return true
        bytes32 messageHash = HashMessage(_message);
        bytes32 signedMessageHash = SignedHashMessage(messageHash);
        return recover(signedMessageHash, _sig) == _signer;
    }

    function HashMessage(string memory _message) public pure returns(bytes32){
        return keccak256(abi.encodePacked(_message));
    } 

    function SignedHashMessage(bytes32 _messagehash) public pure returns(bytes32){
        return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32" , _messagehash));
        //https://blog.ricmoo.com/verifying-messages-in-solidity-50a94f82b2ca
        //imp to add that string before the messagehash to prevent some mishaps, read the link 
        //now this is the actual msg which is signed when we sign off-chain
    }

    //function to recover the signer i.e. the address which signed the message
    function recover(bytes32 _signedmessagehash, bytes memory _sig) public pure returns(address){
        (bytes32 r, bytes32 s, uint8 v) = split(_sig);
        return ecrecover(_signedmessagehash, v, r, s);
    }

    //split function to split the signature into 3 components : v,r,s
    function split(bytes memory _sig) internal pure returns(bytes32 r, bytes32 s, uint8 v){
        //signature length should be equal to 65
        //bcoz bytes32 + bytes32+ 8bits which is 1 byte = 65 bytes
        require(_sig.length == 65, "invalid signature length");
    
        //now _sig is dynamic data coz it has variable length and for dynamic data
        //first 32 bytes stores the length of the data
        //Also _sig is the pointer to where the actual signature is stored and not the actual signature
    
        assembly {
            r := mload(add(_sig, 32))
            s := mload(add(_sig, 64))
            v := byte(0, mload(add(_sig, 96)))
        }
        //r := mload(add(_sig, 32)) ... this means from the pointer of signature skip the 32 bytes coz its the length of the sig and store the value of r in 32 bytes after that
        //s := mload(add(_sig, 64))..... this means from the pointer skip 64 bytes : 32 bytes of length and 32 bytes where value of r is stored
        //v := byte(0, mload(add(_sig, 96))) .... this means after 96 bytes we only need 1 byte to store the value of v
        //we don't need to write return here coz we already mentioned r,s,v in the returns
    }

    //to deploy do as it is as told in the below video but in the remix terminal coz in browser console we r continuously getting "pending" promise
    //https://www.youtube.com/watch?v=vYwYe-Gv_XI&list=PLO5VPQH6OWdVQwpQfw9rZ67O6Pjfo6q-p&index=50&ab_channel=SmartContractProgrammer

}
