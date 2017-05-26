start-hbase.sh
echo "create 'customer','personal_details','order_details'" | hbase shell

file="/home/acadgild/data.txt"
while IFS= read -r line
do 
 id= `echo $line | cut -d',' -f1`
name= `echo $line | cut -d',' -f2`
age= `echo $line | cut -d',' -f3`
city= `echo $line | cut -d',' -f4`
state= `echo $line | cut -d',' -f5`
order_number= `echo $line | cut -d',' -f6`
quantity= `echo $line | cut -d',' -f7`
amount= `echo $line | cut -d',' -f8`
echo "put 'customer','$id','personal_details:name','$name'" | hbase shell
echo "put 'customer','$id','personal_details:age','$age'" | hbase shell
echo "put 'customer','$id','personal_details:city','$city'" | hbase shell
echo "put 'customer','$id','personal_details:state','$state'" | hbase shell
echo "put 'customer','$id','order_details:order_number','$order_number'" | hbase shell
echo "put 'customer','$id','order_details:quality','$quantity'" | hbase shell
echo "put 'customer','$id','order_details:amount','$amount'" | hbase shell
done <"$file"
