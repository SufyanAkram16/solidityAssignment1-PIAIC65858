pragma solidity ^0.8.0;

contract enroll_Student{
    
    address private myAdress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;  // account as a private address
    
    enum Gender {Male, Female}   //enum for gendre & class type
   
    enum Class {online, onsite}
   
    uint totalBalance;

struct Student{                       // struct for single student data
     string name;
     uint age;
     uint rollNo;
     address addres;
     bool hasBSDegree;
     Gender gender;
     Class class;
     
 }
 
        uint public noOfEnrolledStudens;
        mapping (uint => Student) studentData;  // Mapping for multiple students record
        
        //function store data and transfer 2 ether to owner

    function enrollStudent (string memory _name, uint _age, uint _rollNo,address _address,bool _hasBSDegree, Gender _gender, Class _class ) public payable{
        
        require(myAdress != msg.sender);
        
        require (msg.value >= 2);
        
        Student memory s1 = Student(_name, _age, _rollNo,_address, _hasBSDegree, _gender, _class);
        
        payable(myAdress).transfer(msg.value);
        
        studentData[_rollNo] = s1;
        
        noOfEnrolledStudens++;
        
        totalBalance += msg.value;
       
        
    }
    // function to identify the registered students has BS degree or not.
    function hasBSDegree(uint _rollNo) public view returns(bool){
        
        return studentData[_rollNo].hasBSDegree;
    }
    
    // function to check the collected amount from the enrolled students
    
    function totalAmount()  public view returns(uint){
    
        return totalBalance;
    }
    
    //  function to get the student data/Record
     function getStudentData(uint _rollNumber)public view returns(string memory _name, uint _age,uint _rollNo, address addres, bool _hasBSDegree,Gender _gender,Class _class){
        return(
            studentData[_rollNumber].name,
            studentData[_rollNumber].age,
            studentData[_rollNumber].rollNo,
            studentData[_rollNumber].addres,
            studentData[_rollNumber].hasBSDegree,
            studentData[_rollNumber].gender,
            studentData[_rollNumber].class
             );
    
     }
}