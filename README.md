# fixed2delimited
A gawk script to convert fixed-width SQL dump-style outputs like the one below to standard delimited (CSV-style) text files. This style of file is typically produced by SQL query tools.
```
empno ,ename    ,job        ,hiredate  ,sal
------,---------,-----------,----------,---------
7782  ,CLARK    ,MANAGER    ,09-JUN-81 ,2450.00
7839  ,KING     ,PRESIDENT  ,17-NOV-81 ,5000.00
7934  ,MILLER   ,CLERK      ,23-JAN-82 ,1300.00
```
The width of each field is determined by the second line (the dashed line shown above) as it contains consistent characters to correctly identify the widths of each field. The resulting output would be a standard delimited file like this one:
```
7782,CLARK,MANAGER,09-JUN-81,2450.00
7839,KING,PRESIDENT,17-NOV-81,5000.00
7934,MILLER,CLERK,23-JAN-82,1300.00
```
# Usage
Example command  to start gawk in Windows (reading in all files):
```
for %n in (*.txt) do gawk -f fixed2csv.awk %n >%n.csv
```
This script can handle large files. I typically had it converting 2-3 GB files.
# Background
In my case I had a bunch of fixed-width SQL dumps that I needed to be convert. The field lengths in each file was different and determining the start and end of each field would be time consuming so this needed to be done dynamically.
