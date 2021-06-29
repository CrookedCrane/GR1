pragma solidity 0.6.6;

abstract contract RouterInterface {
    // Adds liquidity to an ERC-20⇄WETH pool with ETH.
    // token:	The contract address of the desired token.
    // amountTokenDesired:	The amount of token to add as liquidity if the WETH/token price is <= msg.value/amountTokenDesired (token depreciates).
    // msg.value (amountETHDesired):	The amount of ETH to add as liquidity if the token/WETH price is <= amountTokenDesired/msg.value (WETH depreciates).
    // amountTokenMin:	Bounds the extent to which the WETH/token price can go up before the transaction reverts. Must be <= amountTokenDesired.
    // amountETHMin:	Bounds the extent to which the token/WETH price can go up before the transaction reverts. Must be <= msg.value.
    // to:	Recipient of the liquidity tokens.
    // deadline:	Unix timestamp after which the transaction will revert.
    function addLiquidityETH(
        address token,
        uint amountTokenDesired,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external payable {}
    
    address public WETH;
    
    function getAmountsIn(uint amountOut, address[] memory path)
        public
        view
        virtual
        returns (uint[] memory amounts);
    
    // Swaps an exact amount of tokens for as much ETH as possible
    // amountIn:        The amount of input tokens to send.
    // amountOutMin:	The minimum amount of output tokens that must be received for the transaction not to revert.
    function swapExactTokensForETH(uint amountIn, uint amountOutMin, address[] calldata path, address to, uint deadline)
        external
        virtual
        returns (uint[] memory amounts);
     
    // Swaps an exact amount of ETH for as many output tokens as possible
    // msg.value (amountIn):	The amount of ETH to send.
    // amountOutMin:	        The minimum amount of output tokens that must be received for the transaction not to revert.
    function swapExactETHForTokens(uint amountOutMin, address[] calldata path, address to, uint deadline)
        external
        payable
        virtual
        returns (uint[] memory amounts);
        
    // Receive an exact amount of ETH for as few input tokens as possible
    // amountOut:		The amount of ETH to receive.
    // amountInMax:	    The maximum amount of input tokens that can be required before the transaction reverts.
    // path:	        An array of token addresses. path.length must be >= 2. Pools for each consecutive pair of addresses must exist and have liquidity.
    // to:	            Recipient of ETH.
    // deadline:	    Unix timestamp after which the transaction will revert.
    function swapTokensForExactETH(uint amountOut, uint amountInMax, address[] calldata path, address to, uint deadline)
        external
        virtual
        returns (uint[] memory amounts);
        
    // Receive an exact amount of tokens for as little ETH as possible
    // amountOut:	                The amount of tokens to receive.
    // msg.value (amountInMax):	    The maximum amount of ETH that can be required before the transaction reverts.
    // path:	                    An array of token addresses. path.length must be >= 2. Pools for each consecutive pair of addresses must exist and have liquidity.
    // to:	                        Recipient of the output tokens.
    // deadline:	                Unix timestamp after which the transaction will revert.
    function swapETHForExactTokens(uint amountOut, address[] calldata path, address to, uint deadline)
        external
        payable
        virtual
        returns (uint[] memory amounts);
        
    // Adds liquidity to an ERC-20⇄ERC-20 pool.
    // tokenA:	        The contract address of the desired token.
    // tokenB:	        The contract address of the desired token.
    // amountADesired:	The amount of tokenA to add as liquidity if the B/A price is <= amountBDesired/amountADesired (A depreciates).
    // amountBDesired:	The amount of tokenB to add as liquidity if the A/B price is <= amountADesired/amountBDesired (B depreciates).
    // amountAMin:	    Bounds the extent to which the B/A price can go up before the transaction reverts. Must be <= amountADesired.
    // amountBMin:	    Bounds the extent to which the A/B price can go up before the transaction reverts. Must be <= amountBDesired.
    // to:	            Recipient of the liquidity tokens.
    // deadline:    	Unix timestamp after which the transaction will revert.
    function addLiquidity(address tokenA, address tokenB, uint amountADesired, uint amountBDesired, uint amountAMin, uint amountBMin, address to, uint deadline) 
        external 
        virtual
        returns (uint amountA, uint amountB, uint liquidity);
        
    // Swaps an exact amount of input tokens for as many output tokens as possible
    // amountIn:        amount of input tokens to send.
    // amountOutMin:	The minimum amount of output tokens that must be received for the transaction not to revert.
    // path:	        An array of token addresses. path.length must be >= 2. Pools for each consecutive pair of addresses must exist and have liquidity.
    // to:	            Recipient of the output tokens.
    // deadline:    	Unix timestamp after which the transaction will revert.
    function swapExactTokensForTokens(uint amountIn, uint amountOutMin, address[] calldata path, address to, uint deadline) 
        external
        virtual
        returns (uint[] memory amounts);
    
    // Receive an exact amount of output tokens for as few input tokens as possible
    // amountOut:	    The amount of output tokens to receive.
    // amountInMax:	    The maximum amount of input tokens that can be required before the transaction reverts.
    // path:	        An array of token addresses. path.length must be >= 2. Pools for each consecutive pair of addresses must exist and have liquidity.
    // to:	            Recipient of the output tokens.
    // deadline:	    Unix timestamp after which the transaction will revert.
    function swapTokensForExactTokens(uint amountOut, uint amountInMax, address[] calldata path, address to, uint deadline) 
        external
        virtual
        returns (uint[] memory amounts);
    
    
}