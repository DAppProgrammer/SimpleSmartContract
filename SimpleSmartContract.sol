pragma solidity ^0.5.1;

contract SimpleSmartContract {
    address Owner;
    uint public PeopleCount = 0;
    mapping(uint256 => Person) public People;
    
    struct Person {
        uint256 _id;
        string _firstName;
        string _lastname;
    }
    
    constructor() public {
        Owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(Owner == msg.sender, "Only owner of the contract can call this method");
        _;
    }
    
    function AddPerson(string memory _firstName, string memory _lastname) public onlyOwner {
        PeopleCount++;
        People[PeopleCount] = Person(PeopleCount,_firstName,_lastname);
    }
        
}
