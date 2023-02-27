## Cairo 1 Under the Hood - 

Let's try and understand what exactly happens when we "run" our Cairo 1 programs. In short, there are three important steps in the new our program's lifecycle - 

- Cairo Code (High Level)
- Sierra (Intermediate) Representation
- CASM (Assembly) 

After this, the program trace goes through the highly mathematical concept of arithmetization, various commitment stages, FRI and is finally deployed to StarkNet and proven as a STARK. More on that [here](https://starkware.co/stark-101/).  

You've already written the code - now let's look at what this "Sierra" thing is. 

In Cairo 0, your high level programs were compiled directly to assembly language. However, Cairo 1 introduces a new "safety-net" for it's programs called Sierra. You can think of Sierra as a semi low-level language which your program compiles to before going on to the assembly stage.

### Why Sierra ??? 

Imagine a normal transaction on StarkNet. You call a method on a contract, and then sign the transaction (with a certain gas fee of course) to pass it on to the sequencer. The sequencer validates your transaction, and then charges your account the associated gas fee once the transaction is put safely inside a block. Yayyy !!

Now what exactly do you think happens if the sequencer rejects your transaction ? 

For starters - the sequencer had to do some work to figure out it is a bad transaction. Work that cost time and money. Moreover, as per Cairo 0's design - the sequencer cannot prove to the Ethereum network that it failed this transaction (Cairo can only prove valid transactions). 

Since your transaction is not included in the block, you are not charged gas fees - and the sequencer has to run a loss. Sad :( Wouldn't it be nice if a signer could prove ALL their transactions - even invalid ones - and be made to gas fees for everything they initiate ? 

In comes Sierra !! 

Basically, once you write your Cairo 1 program - the compiler auto-generates another program based on yours. This new program (written in a lower language) is written in a fail-safe way, i.e, it CANNOT fail. At best, it can have branching conditions that return `true` or `false` if a set of conditions is not met. 

For instance, it will turn the pseudo code ... 

```
 // assert myBalance >= myTransactionSize
```
into 
```
if (myBalance < myTransactionSize) -> throw an error 
else -> go on 
```
so now, the program returns a valid (albeit `false`) value instead of breaking and outputting an error message. 

### How Sierra Works 

First, let's define what can throw a fail when running a Cairo program - 

- Assert statements
- Dereferencing illegal addresses
- Undefined Opcodes
- Very long runs 

Now that we have concrete examples of things Sierra is supposed to protect - we want to make a language that is 

- Safe
- Efficient to compile
- Simple to understand 
- Has low overhead

You can take a look at the various safety features implemented in Sierra over [here](https://www.youtube.com/watch?v=-EHwaQuPuAA). Your Sierra code is converted to CASM at deployment time, so from the user's perspective - you basically end up deploying Sierra and not CASM. 

For more on Cairo 1 and it's future implementations - please take a look at [this](https://www.youtube.com/watch?v=qp2YIy8JN10). 





 


