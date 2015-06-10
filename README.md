Implementation of Code Breaker inspired by the RSpec Book.

### Tests
```
$ rake spec
```

### Usage
```
$ ./codebreaker
```

### How to play
The code maker created a 4 digit secret code with numbers from 1 to 6. You have 4 tries to guess the code.

For every try the code maker will reply with some feedback.

- `+` indicates an exact match: one of the numbers in the guess is the same as one of the numbers in the secret code and in the same position.
- `-` indicates a number match: one of the numbers in the guess is the same as one of the numbers in the secret code but in a different position.
