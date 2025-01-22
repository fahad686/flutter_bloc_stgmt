  import 'package:flutter/material.dart';

class EquatableTesting extends StatefulWidget {
  const EquatableTesting({super.key});

  @override
  State<EquatableTesting> createState() => _EquatableTestingState();
}

class _EquatableTestingState extends State<EquatableTesting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(),
      floatingActionButton: FloatingActionButton(onPressed: (){
        //check equtable
        Person person1=Person(name: "fahad", age: 26);
        Person person2=Person(name: "fahad", age: 26);
        print("Check what same value object return : ${person1==person2}");
        
        //so result is false because a instance is equal to himself, not other instance ,below
        print("same instance result: ${person1==person1}");

        //we also see with their has code
        print("compare Hash Code of person1 & persona2 objects ${person1.hashCode}  & ${person2.hashCode} ");
        
        // as you see that we got different instance has different  hashcode while both instance have same value


      },child: Icon(Icons.heart_broken,color: Colors.red,),),
    );
  }
}

class Person{
  final String name;
  final int age;
  Person({required this.name,required this.age});

// check equtable with dynamically
@override
bool operator==(Object person1){
return identical(Object, person1)|| person1 is Person && runtimeType== person1.runtimeType && name== person1.name && age == person1.age;
}
@override
  // TODO: implement hashCode
  int get hashCode => name.hashCode^age.hashCode;


}