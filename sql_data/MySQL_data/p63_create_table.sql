CREATE TABLE shopdb.memberTBL(
  memberID CHAR(8) NOT NULL,
  memberName CHAR(5) NOT NULL,
  memberAddress CHAR(20) NULL,
PRIMARY KEY(memberID));

CREATE TABLE shopdb.productTBL(
  productName CHAR(4) NOT NULL,
  cost INT NOT NULL,
  memberDate DATE NULL,
  company CHAR(5) NULL,
  ammount INT NOT NULL,
  PRIMARY KEY (productName));