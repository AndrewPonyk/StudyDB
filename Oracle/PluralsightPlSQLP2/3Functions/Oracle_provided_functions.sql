--http://docs.oracle.com/cd/E11882_01/server.112/e41084/functions002.htm#SQLRF51178

select round(12.23456, 1) from dual;

select lpad('ab', 10) from dual;

select upper('a') from dual;

-- Using functions in anonymous block
BEGIN
  DBMS_OUTPUT.PUT_LINE(34);
end;

/*
Numeric Functions
Numeric functions accept numeric input and return numeric values. Most numeric functions return NUMBER values that are accurate to 38 decimal digits. 
The transcendental functions COS, COSH, EXP, LN, LOG, SIN, SINH, SQRT, TAN, and TANH 
are accurate to 36 decimal digits. The transcendental functions ACOS, ASIN, ATAN, and ATAN2 are
accurate to 30 decimal digits. The numeric functions are:

ABS
ACOS
ASIN
ATAN
ATAN2
BITAND
CEIL
COS
COSH
EXP
FLOOR
LN
LOG
MOD
NANVL
POWER
REMAINDER
ROUND (number)
SIGN
SIN
SINH
SQRT
TAN
TANH
TRUNC (NUMBER)
WIDTH_BUCKET */


/*
Character Functions Returning Character Values
Character functions that return character values return values of the following data types unless otherwise documented:

If the input argument is CHAR or VARCHAR2, then the value returned is VARCHAR2.

If the input argument is NCHAR or NVARCHAR2, then the value returned is NVARCHAR2.

The length of the value returned by the function is limited by the maximum length of the data type returned.

For functions that return CHAR or VARCHAR2, if the length of the return value exceeds the limit, then Oracle Database truncates it and returns the result without an error message.

For functions that return CLOB values, if the length of the return values exceeds the limit, then Oracle raises an error and returns no data.

The character functions that return character values are:


CHR
CONCAT
INITCAP
LOWER
LPAD
LTRIM
NCHR
NLS_INITCAP
NLS_LOWER
NLS_UPPER
NLSSORT
REGEXP_REPLACE
REGEXP_SUBSTR
REPLACE
RPAD
RTRIM
SOUNDEX
SUBSTR
TRANSLATE
TRANSLATE ... USING
TRIM
UPPER
Character Functions Returning Number Values
Character functions that return number values can take as their argument any character data type. The character functions that return number values are:


ASCII
INSTR
LENGTH
REGEXP_COUNT
REGEXP_INSTR
Character Set Functions
The character set functions return information about the character set. The character set functions are:


NLS_CHARSET_DECL_LEN
NLS_CHARSET_ID
NLS_CHARSET_NAME

*/