# Solidity Simple Upgradable Proxy Contract

This example demonstrates a simplified upgradable proxy pattern written in Solidity. It is designed solely to showcase the basic mechanism of the pattern, without implementing security checks or other optimizations.

``Upgradable contracts`` are used to overcome the limitations of immutable smart contracts on the blockchain. The ``proxy pattern`` allows us to separate the logic of a contract into a different contract, enabling upgrades to the logic contract without affecting the stored data, thus maintaining data persistence while adding new functionalities.

## Test
To run the tests, use the following command:

```bash
forge test -vvv
```

## Warning
This example is only intended to demonstrate the working principle of the upgradable proxy pattern. In real-world projects, proper security measures and validations must be applied.
