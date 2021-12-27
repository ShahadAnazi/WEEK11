pragma solidity ^0.8.0;


contract Bank {

    mapping(address => uint ) account_balances;

    function get_balances() external view virtual returns (uint) {
        return account_balances[msg.sender];
    }


    function transfer (address recipient, uint amount) virtual public {

        account_balances [msg.sender] -= amount;
        account_balances [recipient] += amount ;
    }


      function withdraw (uint amount) virtual public {

          account_balances[msg.sender] -= amount;
          payable (msg.sender).transfer(amount);

      }

      receive () external payable {
          account_balances[msg.sender] += msg.value;
      }

}
