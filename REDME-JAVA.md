目录 

1 [介绍](#1介绍)
- 1.1 为什么要有编码规范
- 1.2 参考资料

2 文件名
- 2.1 文件后缀
3 文件组织
- 3.1 Java源文件
- 3.1.1 开头注释
- 3.1.2 包和引入语句
- 3.1.3 类和接口声明

4 缩进排版
- 4.2 换行

5 注释
- 5.1 实现注释的格式
- 5.1.1 块注释
- 5.1.2 单行注释
- 5.1.3 尾端注释
- 5.1.4 行末注释
- 5.2 文档注释

- 6 声明
- 6.1 每行声明变量的数量
- 6.2 初始化
- 6.3 布局
- 6.4 类和接口的声明

7 语句
- 7.1 简单语句

8 空白
- 8.1 空行
- 8.2 空格

9 命名规范

10 编程惯例
- 10.1 提供对实例以及类变量的访问控制
- 10.2 引用类变量和类方法
- 10.3 常量
- 10.4 变量赋值
- 10.5 数组定义
- 10.6 其它惯例
- 10.6.1 圆括号
- 10.6.2 返回值
- 10.6.3 条件运算符"?"前的表达式
- 10.6.4 特殊注释

11 源文件范例
- 11.1 Java 源文件范例

##1介绍

###1.1 为什么要有编码规范 
编码规范对于程序员而言尤为重要，有以下几个原因： 
- 一个软件的生命周期中，80%的花费在于维护 
- 几乎没有任何一个软件，在其整个生命周期中，均由最初的开发人员来维护 
- 编码规范可以改善软件的可读性，可以让程序员尽快而彻底地理解新的代码  为了执行规范，每个软件开发人员必须一致遵守编码规范。 
###1.2 参考资料 
本文档主要参考了 Sun MicroSystems 公司，Java 语言规范中的编码标准部分。参考链接： http://java.sun.com/docs/codeconv/html/CodeConvTOC.doc.html 
##2 文件名 
###2.1 文件命名 
文件命名与该文件包含的公共类或者接口名字相同。 
####2.2 文件后缀 
Java程序使用下列文件后缀： 
- Java源文件：.java  
- Java编译后的字节码文件：.class  
- MANIFEST.MF：.MF，包配置的说明文件。 
- XML配置文件：.xml z 属性配置文件：.property 
- Jar文件：.jar 
##3 文件组织 
一个文件由被空行分割而成的段落以及标识每个段落的可选注释共同组成。第 11 章的源文 件范例提供了一个布局合理的Java程序范例。 
##3.1 Java源文件长度 
文件长度不得超过2000行。 
###3.2 Java源文件结构 
每个 Java 源文件都包含一个单一的公共类或接口。若私有类和接口与一个公共类相关联， 可以将它们和公共类放入同一个源文件。公共类必须是这个文件中的第一个类或接口。 
Java源文件还遵循以下规则： 
- 开头注释 
- 包和引入语句 
- 类和接口声明 
###3.2.1 开头注释 
所有的源文件都应该在开头有一个C语言风格的注释，其中列版本信息、作者和说明： 
```  
/*    
* Classname    
*    
* Version information    
*    
* Date    
*
* Copyright notice    
*/ 
```
###3.2.2 包和引入语句 
在Java源文件中，第一个非注释行是包语句。在它之后可以跟引入语句。例如： 
``` 
package java.awt; 
import java.awt.peer.CanvasPeer;  
```
注意：引入语句要使用精确引入，例如： 
```
import java.awt.peer.CanvasPeer; 
```
而不是 
``` 
import java.awt.peer.*; 
```
##3.2.3 类和接口声明 
类和接口声明的各个部分出现的先后次序： 
1. 类/接口JavaDoc注释（/**......*/）。  
2. 类或接口的声明。 
3. 类/接口实现的注释（/*......*/），如果有必要的话。该注释应包含任何有关整个类或接口 的信息，而这些信息又不适合作为类/接口文档注释。 
4. 类的（静态）变量。首先是公共（public）变量，随后是保护（protected）变量，再后 是包级别的变量（没有访问修饰符的，默认为friendly），最后是私有（private）变量。  
5. 实例变量。首先是公共（public）变量，随后是保护（protected）变量，再后是包级别 的变量（没有访问修饰符的，默认为friendly），最后是私有（private）变量。  
6. 构造函数 
7. 方法，这些方法应该按功能，而非作用域或访问权限，分组。例如，一个私有的类方法 可以置于两个公有的实例方法之间。其目的是为了更便于阅读和理解代码。 
8. main()函数，如果有main函数的话，则放在类的最后。 9. exit() 除了在 main() 中可以被调用外，其他的地方不应该调用。因为这样做不给任何 代码机会来截获退出。一个类似后台服务地程序不应该因为某一个库模块决定了要退出 就退出。 

##4 缩进排版 4个空格在eclipse中默认作为一个缩进单位（一个TAB 键） 。 

####4.1 行长度 
尽量避免一行的长度超过80个字符，因为很多终端和工具不能很好处理之。 

###4.2 换行 
当一个表达式无法容纳在一行内时，可以依据如下一般规则换行： 
- 在一个逗号后面换行 
- 在一个操作符前面换行 
- 选择较高级别的换行，而非较低级别的换行 
- 新的一行应该与上一行同一级别表达式的开头处对齐 
- 如果以上规则使代码都堆挤在右边，那就回退一个TAB 以下是断开方法调用的一些例子：   
    ```
    someMethod(longExpression1, longExpression2, longExpression3,
         longExpression4, longExpression5); //逗号分割   
    var = someMethod1(longExpression1, 
               someMethod2(longExpression2,                                    
                   longExpression3));  //同级分割 
    ```
以下是两个断开算术表达式的例子。前者更好，因为断开处位于括号表达式的外边，这是个 较高级别的断开。 longName1 = longName2 * (longName3 + longName4 - longName5) + 4 * longname6; //同级分割，正确   longName1 = longName2 * (longName3 + longName4                          - longName5) + 4 * longname6; //越级分割，错误 
 
以下是两个缩进方法声明的例子。前者是常规情形。后者若使用常规的缩进方式将会使第二 行和第三行移得很靠右，所以代之以回退一个TAB：    
``` 
//常规缩进   
someMethod(int anArg, Object anotherArg, String yetAnotherArg,
     Object andStillAnother) {
          ...   
}
```       
//回退一个TAB 消除过深的缩进   
```
private static synchronized horkingLongMethodName(int anArg,       
   Object anotherArg, String yetAnotherArg,       
   Object andStillAnother) {       
   ...
} 
``` 
 
##5 注释 
Java程序有两类注释：实现注释和文档注释(JavaDoc)。实现注释是那些在 C++中见过的， 使用/*...*/和//界定的注释。文档注释(被称为“doc comments”)是 Java 独有的，并由 /**...*/界定。文档注释可以通过JavaDoc工具转换成HTML 文件。 

实现注释用以注释代码或者实现细节。文档注释从实现自由(implementation-free)的角度描 述代码的规范。它可以被那些手头没有源码的开发人员读懂。 
 

注意：频繁的注释有时反映出代码的低质量。当你觉得被迫要加注释的时候，考虑一下重 写代码使其更清晰。 

####5.1 实现注释的格式 
程序可以有 4 种实现注释的风格：块(block)、单行(single-line)、尾端(trailing)和行末 (end-of-line)。 

###5.1.1 块注释 
块注释通常用于提供对文件，方法，数据结构和算法的描述。块注释被置于每个文件的开始 处以及每个方法之前。它们也可以被用于其他地方，比如方法内部。在功能和方法内部的块 注释应该和它们所描述的代码具有一样的缩进格式。 
 
块注释之首应该有一个空行，用于把块注释和代码分割开来，比如： 
```
/*  
 * Here is a block comment.  
 */ 
```

###5.1.2 单行注释 
短注释可以显示在一行内，并与其后的代码具有一样的缩进层级。如果一个注释不能在一行 内写完，就该采用块注释。单行注释之前应该有一个空行。以下是一个 Java 代码中单行注 释的例子： 
```  
if (condition) {       
/* Handle the condition. */
... 
}
```  
###5.1.3 尾端注释 
极短的注释可以与它们所要描述的代码位于同一行，但是应该有足够的空白来分开代码和注 释。若有多个短注释出现于大段代码中，它们应该具有相同的缩进。 
 
以下是一个Java代码中尾端注释的例子：
```   
if (2 == a) {       
    return TRUE;          /*special case*/   
} else {       
    return isPrime(a);    /*works only for odd a*/   
} 
```

###5.1.4 行末注释 
注释界定符"//"，可以注释掉整行或者一行中的一部分。它一般不用于连续多行的注释文本； 然而，它可以用来注释掉连续多行的代码段。以下是所有三种风格的例子：   
```
if (foo > 1) {         
 // Do a double-flip.       
 ...   
 }   
else {       
 return false;    // Explain why here.   
}     
//if (bar > 1) {   
//
//  // Do a triple-flip.   
//   
//}   
//else {   
//    return false;   
//}
``` 

###5.2 文档注释的格式 
文档注释描述Java的类、接口、构造器，方法，以及字段(field)。每个文档注释都会被置于 注释定界符/**...*/之中，一个注释对应一个类、接口或成员。该注释应位于声明之前：   /**     * The Example class provides ...     */ public class Example { ...  } 注意顶层(top-level)的类和接口是不缩进的，而其成员是缩进的。描述类和接口的文档注释 的第一行(/**)不需缩进；随后的文档注释每行都缩进1格(使星号纵向对齐)。成员，包括构 造函数在内，其文档注释的第一行缩进一个TAB，随后每行都缩进一个TAB 加一个空格。 
 
若你想给出有关类、接口、变量或方法的信息，而这些信息又不适合写在文档中，则可使用 实现块注释(见5.1.1)或紧跟在声明后面的单行注释(见5.1.2)。例如，有关一个类实现的细节， 应放入紧跟在类声明后面的实现块注释中，而不是放在文档注释中。 
 
文档注释不能放在一个方法或构造器的定义块中，因为 Java 会将位于文档注释之后的第一 个声明与其相关联。
 
###5.3 类/接口注释的内容 
类、接口的文档注释包含如下信息： 
- 用途。开发人员使用某个类/接口之前，需要知道采用该类/接口的用途。 
- 如何使用。开发人员需要知道该类/接口应该如何使用，如果必要的话还需要注明不应 该如何使用。 
- 开发维护的日志。一个有关于该类/接口的维护记录：时间、作者、摘要。 
 
###5.4 方法注释的内容 
- 该方法是做什么的。 
- 该方法如何工作。 
- 代码修改历史纪录。 
- 方法调用代码示范。 
- 必须传入什么样的参数给这个方法。@param 
- 异常处理。@throws 
- 这个方法返回什么。@return 

##6 声明 

###6.1 每行声明变量的数量 
一行一个声明，因为这样以利于写注释。亦即， 
```
int level;  // indentation level 
int size;   // size of table 
```
不要将不同类型变量的声明放在同一行，例如：
``` 
int foo,  fooarray[];   //不允许 
```
注意：上面的例子中，在类型和标识符之间放了一个空格。 

###6.2 初始化 
尽量在声明局部变量的同时初始化。唯一不这么做的理由是变量的初始值依赖于某些先前发 生的计算。 

###6.3 布局 
只在代码块的开始处声明变量。（一个块是指任何被包含在大括号"{"和"}"中间的代码。）不 要在首次用到该变量时才声明之，这会把注意力不集中的程序员搞糊涂，同时会妨碍代码在
该作用域内的可移植性。 
```
void myMethod() {
 int int1 = 0;        // beginning of method block         
 if (condition) {           
 int int2 = 0;     // beginning of "if" block           
 ...       
 }   
 } 
```
该规则的一个例外是for循环的索引变量 
```
for (int i = 0; i < maxLoops; i++) { ... }
```  
避免声明的局部变量覆盖上一级声明的变量。例如，不要在内部代码块中声明相同的变量名：
```
int count;   
...   
myMethod() {      
  if (condition) {          
    int count = 0;     //不允许
    ...       
  }       
...   
}
``` 

###6.4 类和接口的声明 
当编写类和接口是，应该遵守以下格式规则： 
- 在方法名与其参数列表之前的左括号"("间不要有空格。 
- 左大括号"{"位于声明语句同行的末尾。 
- 右大括号"}"另起一行，与相应的声明语句对齐，除非是一个空语句，"}"应紧跟在"{" 之后。 
- 方法与方法之间以空行分隔 
 ```
class Sample extends Object {
    int ivar1; 
    int ivar2;      
       
    Sample(int i, int j) {           
      ivar1 = i;           
      ivar2 = j; 
    }         

    int emptyMethod() {}       .
    ..   
}    
```

##7 语句 

###7.1 简单语句 
每行至多包含一条语句，例如：
```
argv++;                   // 合法   
argc--;                     // 合法   
argv++; argc--;         // 不允许 
```

###7.2 复合语句 
复合语句是包含在大括号中的语句序列，形如"{ 语句 }"。参考下面的规则： 
- 被括其中的语句应该较之复合语句缩进一个层次 
- 左大括号"{"应位于复合语句起始行的行尾；右大括号"}"应另起一行并与复合语句首行 对齐。 
- 大括号可以被用于所有语句，包括单个语句，只要这些语句是诸如if-else或for控制结 构的一部分。这样便于添加语句而无需担心由于忘了加括号而引入bug。  
  
###7.3 返回语句 
一个带返回值的 return 语句不使用小括号"()"，除非它们以某种方式使返回值更为显见。例 如：
```
   return;     
   return myDisk.size();     
   return (size ? size : defaultSize);      //这样做是因为看起来更清楚  
```

###7.4 If, if-else, if else-if else语句 
if-else语句应该具有如下格式：    
```
if (condition) {       
   statements;  
}  
  
if (condition) { 
   statements;   
} else {      
   statements;   
}    

if (condition) {
  statements;
} else if (condition) {       
  statements;   
} else{     
  statements;   
} 
```        
 注意：if语句总是用"{"和"}"括起来，避免使用如下容易引起错误的格式：
 ```
if (condition)statement; //严格禁止 
```

###7.5 for语句 
一个for语句应该具有如下格式：   
for (initialization; condition; update) {       statements;   } 
注意：for语句总是用"{"和"}"括起来，即便只有一行语句 

###7.6 while语句 
一个while语句应该具有如下格式   
while (condition) {       statements;   } 
注意：while语句总是用"{"和"}"括起来，即便只有一行语句 

###7.7 do-while语句 
一个do-while语句应该具有如下格式：   
do {       statements;   } while (condition); 

###7.8 switch语句(switch Statements) 
一个switch语句应该具有如下格式：   
```
switch (condition) { 
  case ABC:       
    statements;       
    /* falls through */   
  case DEF:       
    statements;       
    break;     
  case XYZ:       
    statements;       
    break;     
  default:       
    statements;       
    break;   
} 
```
每当一个case顺着往下执行时(因为没有break语句)，通常应在break语句的位置添加注释。 上面的示例代码中就包含注释/* falls through */。 

###7.9 try-catch语句 
一个try-catch语句应该具有如下格式： 
```  
try {       
  statements;   
} catch (ExceptionClass e) {
  statements;   
} finally {       
  statements;   
} 
```

##8 空白 

###8.1 空行 
空行将逻辑相关的代码段分隔开，以提高可读性。 
 
下列情况应该总是使用两个空行： 
- 一个源文件的两个片段(section)之间。 
- 类声明和接口声明之间。 
 
下列情况应该总是使用一个空行： 
- 两个方法之间。 
- 方法内的局部变量和方法的第一条语句之间。 
- 块注释（参见"5.1.1"）或单行注释（参见"5.1.2"）之前。 
- 一个方法内的两个逻辑段之间，用以提高可读性。 

###8.2 空格 
下列情况应该使用空格： 
- 一个紧跟着括号的关键字应该被空格分开，例如：   
    ```
    while (true) {       ...   } 
    ```
注意：空格不应该置于方法名与其左括号之间。这将有助于区分关键字和方法调用。 
 
- 空白应该位于参数列表中逗号的后面 
    ```
    void method1(int a, int b) 
    ``` 
- 所有的二元运算符，除了"."，应该使用空格将之与操作数分开。一元操作符和操作数 之间不因该加空格，比如：负号("-")、自增("++")和自减("--")。例如：      a += c + d;     d++;          
 
- for语句中的表达式应该被空格分开，例如：      for (expr1; expr2; expr3)          
 
- 强制转型后应该跟一个空格，例如：  
    ```bash
    char c; int a = 1; c = (char) a; 
    ```
    
###9 命名规范 
命名规范使程序更易读，从而更易于理解。它们也可以提供一些有关标识符功能的信息，以 助于理解代码，不论它是一个常量、包、还是类。 
需要注意的是： 
- 使用完整的英文描述来命名 
- 避免命名超长（15个字符以内比较好） 
- 避免相似的命名。例如：persistentObj 和 persistentObjs 不要一起使用；anSqlStmt 和 anSQLStmt不要一起使用 
- 慎用缩写，如果要用到缩写，请参考下一条 z 按照缩写规则使用缩写。例如：No.代表number数字，ID.代表identification标示。 

| 标识符类型        | 命名规则    | 例子  |
| --------   | :-----   | :---- |
| 包(Packages) | 一个唯一包名的前缀总是全部小写的 ASCII 字母。所有项目包名以 com.chinacache 开头。后面是程序所在项 目的英文名称，不含版本号（除非有特别 需要与以前版本区分，如：两个版本可能 同时运行），再下为子系统的名称，每个子 系统内按照类别区分。 | com.chinacache.billing com.chinacache.billing.node com.chinacache. billing.node.util |
| 类(Classes)  | 命名规则：类名是个一名词，采用大小写 混合的方式，每个单词的首字母大写。尽 量使你的类名简洁而富于描述。使用完整 单词，避免缩写词(除非该缩写词被更广泛 使用，像URL，HTML)  | class Raster; class ImageSprite; |
| 接口(Interfaces) | 命名规则：大小写规则与类名相似，常以 "able"、"ible"结尾。 | interface RasterDelegate; interface Runnable; interface Accessible; |
| 方法(Methods) | 方法名是一个动词，采用大小写混合的方 式，第一个单词的首字母小写，其后单词 的首字母大写。 | run(); runFast(); getBackground(); |
| 变量(Variables) 参数(Parameter) | 变量用大小写混合的方式，第一个单词的 首字母小写，其后单词的首字母大写。变 量名不应以下划线或美元符号开头，尽管 这在语法上是允许的。 变量名应简短且富于描述。变量名的选用 应该易于记忆，即，能够指出其用途。尽 量避免单个字符的变量名，除非是一次性 的临时变量。临时变量通常被取名为i，j， k，m和n，它们一般用于整型；c，d，e， 它们一般用于字符型。 | char c; int i; float myWidth; |
| 集合(Collection) 数组(Array) | 集合变量例如数组、向量，在命名的时候 必须从名字上面体现出该变量为复数、数 组。还可以巧妙的使用some词头。 | customers，orderItems， postedMessages someCustomers，someItems， someMessages |
| 常量(Constants) | 常量的声明，应该全部大写，单词间用下 划线隔开。 | static final int MIN_WIDTH = 4; static final int MAX_WIDTH = 999; static final int GET_THE_CPU = 1; |

###10 编程惯例
 
####10.1 提供对实例以及类变量的访问控制 
若没有足够理由，不要把实例或类变量声明为公有。 
 
####10.2 引用类变量和类方法 
避免用一个对象访问一个类的静态变量和方法。应该用类名替代。例如：   
```bash
classMethod();             //合法
AClass.classMethod();      //合法   
anObject.classMethod();    //不允许 
```

###10.3 常量 
位于for循环中作为计数器值的数字常量，除了-1,0和1之外，不应被直接写入代码。 

###10.4 等值比较 
常量放置在比较的左边，为了避免和赋值操作混淆，例如： 
```
if (0 == id) {   …… }
``` 
10.5 变量赋值 
避免在一个语句中给多个变量赋相同的值。它很难读懂。例如：   
```
fooBar.fChar = barFoo.lchar = 'c'; //禁止 
```
不要将赋值运算符用在容易与相等关系运算符混淆的地方。例如：   
```
if (c = d++) {        // 不允许       ...   } 
```
应该写成
```   
if (0 != (c = d++)) {     ...   } 
```      
不要使用内嵌赋值运算符，例如：   
```
d = (a = b + c) + r;        //禁止 
```
应该写成
```   
a = b + c;
d = a + r; 
```

###10.6 数组定义 
数组应该总是用下面的方式来命名：    
byte[] buffer;  
而不是：   
byte buffer[]; 

###10.7 其它惯例 

###10.7.1 圆括号 
一般而言，在含有多种运算符的表达式中使用圆括号来避免运算符优先级问题，是个好方法。 即使运算符的优先级对你而言可能很清楚，但对其他人未必如此。你不能假设别的程序员和 你一样清楚运算符的优先级。但是也同样应该避免无意义的圆括号。      if ((I) = 42) { // 避免这种情况，括号毫无意义！   if (a == b && c == d)     // 不允许   if ((a == b) && (c == d))  // 正确 10.7.2 返回值 
设法让你的程序结构符合目的。例如：  
``` 
if (booleanExpression) {       
  return true;   
} else {       
  return false;   
} 
```
应该代之以如下方法：  
``` 
return booleanExpression; 
``` 
类似地：   
```
if (condition) {       
  return x;   
}   
  return y; 
````
应该写做：
```   
return (condition ? x : y); 
```
10.7.3 条件运算符"?"前的表达式 
如果一个包含二元运算符的表达式出现在三元运算符" ? : "的"?"之前，那么应该给表达式添 上一对圆括号。例如：
```
(x >= 0) ? x : -x; 10.7.4 特殊注释 
```
用FIXME来标识某些已知的缺陷。 
用TODO来标识未完成的内容。 例如：
```
//FIXME 这个算法性能比较低 
//TODO 需要实现多线程的功能 
```

###11 源文件范例 

####11.1 Java 源文件范例 
```bash   
/*  
* @(#)Example.java        
* 1.0 2007-4-11  
* Copyright (c) 1998-2007 ChinaCache   
* All rights reserved.  
*  
*/ 
package com.chinacache.example; 
 
import com.chinacache.example.MyLog; 
/**  
* 这里写关于这个类的一些基本功能描述。  
*
* @version  1.0 2007-4-11  
* @author  Jeffrey Hu  
*/ 
public class Example extends SomeClass {     
/* 本类的一些实现细节写这里 */ 
 
/** 类变量classVar1的JavaDoc说明 */     
public static int classVar1;  
private static Object classVar2; 

    /** 实例变量instanceVar1 的JavaDoc说明 */
    public Object instanceVar1; 
    
    /** 实例变量instanceVar2 的JavaDoc说明 */
    protected int instanceVar2; 
    
    /** 实例变量instanceVar3 的JavaDoc说明 */
    private Object[] instanceVar3; 
    
    /**       
    * 构造方法的JavaDoc说明。      
    */     
    public Example () {         
    // 实现细节     
    } 
    
    /**
    * doSomething 方法的JavaDoc说明.      
    */   
    public void doSomething() {
    // 方法实现的细节说明      
    } 
    
    /**      
    * doSomethingElse方法的JavaDoc说明.      
    * @param someParam 参数的描述      
    */     
    public void doSomethingElse(Object someParam) {         
    // 方法的实现细节     
    } 
} 
```