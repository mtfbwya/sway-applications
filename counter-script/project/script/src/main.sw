script;

use interface::Counter;

fn main(contract_id: ContractId, clear: bool) -> u64 {
    // An abi cast is a way to call a contract at a given contract_id with the given abi
    let counter = abi(Counter, contract_id.value);
    // Here we call the count method, which returns the current count
    let a = counter.count(); 
    // As we just deployed the contract, the counter should be 0
    require(a == 0, "Counter should be 0");
    // Here we call the increment method
    let a = counter.increment(); 
    // After calling the increment method, the counter should increment by 1
    require(a == 1, "Counter should be 1"); 
    // Again, we call the increment method
    let a = counter.increment(); 
    // After calling the increment method, the counter again increments by 1, so it should be 2
    require(a == 2, "Counter should be 2"); 
    if clear {
        // Here we clear the counter if the `clear` argument passed to the script is true
        counter.clear(); 
    }
    // Getting the current count
    let a = counter.count(); 
    // We return the current count
    return a; 
}
