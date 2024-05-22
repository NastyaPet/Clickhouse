CREATE DATABASE Anastasia;

CREATE TABLE Anastasia.test (
  a UInt32,
  b String,
  c Enum8('a' = 1, 'b' = 2)
) Engine = Log();

SELECT * FROM Anastasia.test
WHERE b like '%abc%' AND a > 10;


INSERT INTO Anastasia.test (a,b,c)
SELECT 
  rand() as a,
  fuzzBits(materialize('abcdefabc'),0.1) as b,
  ['a', 'b'][toInt32(randUniform(1,3))]
FROM numbers(100000);

SELECT * FROM Anastasia.test 
WHERE b like '%abc%' AND a > 10 LIMIT 3;


