@fib=nil;def fib num; @fib||=[0,1]; @fib[num]||=fib(num-1)+fib(num-2);end
