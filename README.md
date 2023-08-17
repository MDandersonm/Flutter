#Dart 기본문법
```dart
//함수 
void func1(int a, int b) {
    print(a+b) ;
 }

int func2(int a, int b) {
    return a+b;
 }

void routine(Function start){
  
  String result = start();
  print(result);
}

//
class Dog{
  String? name;  //? 면 null도 가능하다는 얘기
  int? age;
  String? color;
  Dog( {this.name,this.age , this.color='red'}); //생성자 //  { } 로 감싸면 선택적으로 써도되고 안써도되고.(선택적 매개변수)
  // = 'red' 로 하면 초기값을 정해주는거.
  
  
}

class Chef{
  
    void cook(){
      print("요리를시작합니다.");

    }
    void handWash(){ // 다트는 낙타표기법사용
      print("손을 씻습니다");    
    }

  }

  //이 함수는 내가 수정할 수 없는 함수라 가정.
  void goCompany(Chef c){//회사에가다.
    c.cook();  

}

//상속
class Burger{
  String? name;
  Burger(this.name){
    print("부모생성자실행");
    print("버거");
    print(name);
  }
}
class CheeseBurger extends Burger{
  CheeseBurger(String name) :super(name) { //부모의 생성자(Burger)가 먼저실행된다. 
    // :super(name) 이니셜라이즈드 키워드 :  부모,자식생성자가 실행되기 전에 , 부모한테 값을 전달할때 씀 
    //부모생성자에서  this.name으로 받아옴
    print("자식생성자실행");
    super.name=name;
    print("치즈버거");
  }
}


//믹스인
mixin Engine{
  int power =5000;
  
}
class BMW with Engine{
  
  
}

//추상클래스
abstract class Animal{  //타입일치를 위해서만 사용
  void sound();// 추상메서드 몸체가없는함수
  
}
class Cat implements Animal{
  void sound(){
    print("야옹");
  }
}
class Cow implements Animal{
  void sound(){
    print("음메");
  }
}

class Fish implements Animal{
  @override //부모의 함수를 무효화시킨다. 
  void sound(){ //재정의
    print("파닥"); //sound메서드를 쓰게 강제성을 부여.  Animal을 구현해서 만들었다.
  }

}


//final 과 const의 차이? final:값을 무조건 초기화 해야한다.(런타임시에 초기화)
//  const: 컴파일시에 초기화

class Animal1{
    final name;//값을 초기화해야함   생성자를 만들어서 값을 넣어주거나.
//   final name="gg";
  const Animal1(this.name);// 생성자  
}

  //null safety
//   String nam1; //오류 null을 허용해줘야함
  String? nam1;

class Person{
  String? username;
  int age;
  String color;
  Person( {this.username, this.age=2 , required this.color} );//선택적매개변수 { }하면 오류가남.  그래서 변수에 ? 붙여서 null을 허용해줘야함
  //아니면 변수에 초기값을 age=1처럼 설정해주면됨. 
  //아니면 required를 걸면 반드시 받아야하는 값으로  설정해줄 수 있다. 
}

class DDog{
  String? name;
  int? age;
  DDog({required this.name,this.age});
}


void main() {
  
  //null safety
  //print(nam1!.length);// ! : 절대 null이 아니니까 length속성에 접근해달라는 말.(위험)
  print(nam1?.length); // null이라면 length 속성에 접근하지말고 그냥 null을 출력해달라는말( 안전)
  print(nam1?? "값없음");  //nam1이 null이면 값없음을 출력하라는말  null대체 연산자.
  
  //const : 들어오는 값에따라 메모리 주소를 같게할지 다르게할지 결정한다.
  Animal1 a1 = const Animal1("강아지");
  Animal1 a2 = const Animal1("강아지");
  Animal1 a3 = const Animal1("강아지2");
  print(a1.hashCode);
  print(a2.hashCode);//값이 같으면 동일한 주소가 나옴
  print(a3.hashCode);
  
  
  //추상클래스
  
    Fish f1 =Fish();
    print(f1.sound);
  
  //믹스인
  BMW bm =BMW();
  print(bm.power);
  
  //상속
  
  CheeseBurger cb = CheeseBurger("치즈햄버거");
  print("cb.name : ${cb.name}");
  
  
  
  
//   Chef c =Chef();
//   c.handWash();//손씻고
//   goCompany(c);//회사감
  //위 과정을 한번에 표현해주고싶다면?
  
  //계단표기법
  goCompany(Chef()..handWash());// 객체를 넘기면서  함수(손씻기) 를 하나실행해줌
  
  
  //클래스와 객체
  
    
  //클래스
  //클래스는 메모리에 로드가 안되어있음.
  //new 객체 생성되는 순간 메모리 로드됨
  //   Dog d1 =  new Dog(); 에서 new생략가능
  
  
  Dog r1 = Dog(name:"Toto", age :12);
  Dog r2 = Dog(name:"Tora");
  print (r1.name);
  print (r2.name);
  print (r2.age);
  print (r2.color);
  
  // 변수
  
  int n1 =1;
  double d1 = 10.1;
  bool b1 =true;
  String s1 ="홍길동";
  print("정수 : $n1"); // + 를이용하면 에러난다.
  
  var n2 =2 ; //타입추론해서 int타입으로 들어가게 됨
  var d2 =10.1 ; //타입추론해서 double타입으로 들어가게 됨 
  print(n1.runtimeType);
  
  n1=11;
  print(n1);
//   n1=10.1;  //int변수에 double타입 값을 넣을 수 없음
  
  dynamic n3 =1; //dynamic타입은 모든 타입 다 가능.
  print(n3);
  
  n3=10.1;
  print(n3);
  print("n3.runtimeType : ${n3.runtimeType}");  //문자열과 통합해서 사용하려면 ${ } 로 감싸주면 된다.
  
  
  
  //연산자
  print(5~/2);  //몫 연산자.
  
  
  //3항 연산자
  //String? username = null; //null이라고 정의하려면 타입에 ? 를 붙인다.
  String? username = "장보고";
   print(username ?? "홍길동"); //username이 null이면 홍길동을 출력, 아니면 장보고를 출력.
  
  //함수호출
  func1(5,4);
  int sum=func2(3,2);
  print(sum);
  
  //익명함수
  
  routine((){
    return "짜파게티먹기";
  });
  
  //람다식
  
  routine( ()=>"라면 먹기");
  
  
  //컬렉션 
  //List
  List<int> nums = [1,2,3,4];
  print(nums[3]);
  
  var nums2 = [3,4,5];
  print(nums2);
  
  //Map
  Map<String,dynamic> user = {"id":1, "username":"cos"};
  print(user["id"]);
  
  
  //반복문 잘안쓰고 map함수  많이씀
  var nums3 = nums2.map(  (value)=>value+1).toList();// (1,2,3) 은 iterable타입.
  print(nums3);
  
 
  //where
  var num4 =nums2.where((value)=> value==4).toList(); //조건에 맞는것만 선별
  print(num4);
  
  //spread연산자
  var num5 =[ ...nums2,99];
  print(num5);
  
  //
  var newList= nums2; //얕은복사 ==레퍼런스복사
  var newList2 = [...nums2];   //깊은복사 ==값을 복사
  
  var list1 =   [{"id":1}, {"id":2}];
  var newList1= [...list1];   //[주소,주소] 이렇게 spread한것.
  print(list1);
  print(newList1);
  
  //오브젝트의 깊은복사는 이렇게해야한다
  var newList3 = list1.map((i)=>{...i}).toList();
  print(newList3);
  
  
  
  list1[0]["id"]=10;
  print(list1);
  print(newList1);//오브젝트를 들고있으면 깊은복사가 제대로 안된다. 
  print(newList3);  //깊은복사가 제대로 되었다. 
  
  
  print(list1.hashCode);
  print(newList1.hashCode);//깊은 복사가 되었다 해시코드가 다르다. 
  
  
  //컬렉션을 순회하면서 값을변경     id가 2의 username값을 love로 수정하기
  var users = [ {"id":1, "username":"cos", "password":1234},{"id":2, "username":"ssar", "password":5678 }];
  print(users);
  
  var newUsers= users.map((i)=> i["id"]==2 ? {...i,"username":"love"}: i).toList();
  print(newUsers);
  
  
  
  //final, const => 공통점 :값을 바꿀수 없다.  차이점 : 
  final name1 ="장보";  //final도 타입추론가능해서 타입생략할수있다.
  print(name1);
  
  const name2 ="러브";
  print(name2);
  

  
  
  
  
  
  
  
}

 
```
