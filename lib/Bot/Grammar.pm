
use v6;

grammar Bot::Grammar {
    token TOP               { ^ <program> $ };

    token program {
        <statement>+
    };
    
    token statement {
        <command> <param> \;
    };
    
    token command {
        (GO|LEFT|RIGTH)
    };
    
    token param {
        \d+
    };
};