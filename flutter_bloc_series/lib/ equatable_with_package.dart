  import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class EquatableWithPackage extends StatefulWidget {
  const EquatableWithPackage({super.key});

  @override
  State<EquatableWithPackage> createState() => _EquatableWithPackageState();
}

class _EquatableWithPackageState extends State<EquatableWithPackage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        spacing: 25,
        children: [
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        //check equtable with package 
        Person person1=Person(name: "fahad ali", age: 24);
        Person person2=Person(name: "fahad ali", age: 24);
        print(" ${person1==person2}");
        
        //so result is true because we are using equatble package for checking inctance see ,below
        print(" ${person1==person1}");

        //we also see with their has code
        print("${person1.hashCode} ") ;
         print("${person2.hashCode} ");
        
        // as you see that we got different instance has same hashcode while both instance have same value, its happend because of equatable package 
       
        //Now we are checking how its validate dieferent vlaue of objects
        Person    person3=Person(name: "Mehtab ali  ", age: 20);
        Person     person4=Person(name: "Saeed  ", age: 20);

        print("${person3==person4}");

        //there has code
                print("${person3.hashCode}");
                print("${person4.hashCode}");





      },child: Icon(Icons.heart_broken,color: Colors.red,),),
    );
  }
}

class Person extends Equatable{
  final String name;
  final int age;
  const Person({required this.name,required this.age});
  
  @override
  // TODO: implement props
  List<Object?> get props => [name,age];




}