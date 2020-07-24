#!/bin/bash

counter=0

while [ $counter -lt 50 ]; do
  let counter=$counter+1

  id=$counter
  firstname=$(nl people.txt | grep -w $counter | awk '{ print $2}' | awk -F "," '{print $1}')
  lastname=$(nl people.txt | grep -w $counter | awk '{ print $2}' | awk -F "," '{print $2}')
  age=$(shuf -i 20-25 -n 1)
  
  mysql -u root -p1234 people -e "insert into register values ($id , '$firstname' , '$lastname' , $age)"
  echo "Imported $id:$firstname:$lastname:$age successfuly"
done
