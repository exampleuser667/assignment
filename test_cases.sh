heading_expected=$1

#Test Case 1: check if service is up
test_case_1(){
test_status=0
status=$(curl -s -o /dev/null -w \"%{http_code}\" http://localhost:8000)
if [ $status == '"200"' ]
then
   echo "Test Case 1: Pass" >result.txt
else
   echo "Test Case 1: Fail" >result.txt
   test_status=1
fi
return $test_status
}

#Test Case 2: Check if heading is correct
test_case_2(){
test_status=0
heading=$(curl -s http://localhost:8000/ | xargs | egrep -o '<h1>.*</h1>'|sed "s/<[^>]\+>//g")
if [ $heading == $heading_expected ]
then
   echo "Test Case 2: Pass" >>result.txt
else
   echo "Test Case 2: Fail" >>result.txt
fi
return $test_status
}

#Test Case 3: Check count of failure
test_case_3(){
test_status=0
failure_count=$(cat result.txt |grep Fail|wc -l)
if [ $failure_count == 0 ]
then
   echo "All test passed"
else
   echo "Test failed"
   test_status=1
fi
return $test_status
}
test_case_1
test_case_2
test_case_3
