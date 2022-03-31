//examples of two classes

//public class A{
//    do();
//    public void do(){
//        toy();
//        log(B.foo());
//    }
//}

//public class B{
//    public static String foo(){
//        return source();
//    }
//}



opaque type Mtd = String
opaque type Cls = String
opaque type Var = String
opaque type Typ = String

/* the abstraction function */
def isGlobal(m1: Mtd, m2: Mtd): Bool = if (c1 != c2) true else false //if m1 and m2 are declared by different classes then it is a global flow


rel method(m: Mtd, c: Cls) //represents method m is declared in class c
rel CG(m1: Mtd, m2: Mtd) //represents an edge from m1 to m2 in a call graph
rel AsgStm(x: Var, n: Mtd) //represents assignment x=n()
rel IvkStm(x: Var, n: Mtd) //represents invocation n(x)
rel RtnStm(x: Var, n: Mtd) //represents n{return x}

def asg(x: Var, )

/* incoming dataflow to m2 from m1 with value x*/
rel In(m2, x) :− CG(m1, m2), Out(m1, x). //m2(x)
rel In(m2, x) :− IvkStm(arg, m2). //initialisation of m2: m2(arg)
rel In(m2, x) :- CG(m1, m2), InvokeGlobal(m1, m2), Out(m1, x). //when m1 and m2 are declared by difference class, we unify the input value to m2 and output value of m1

/* outgoing dataflow */
rel Out(m, x) :− AsgStm(x, m), IvkStm(y, m), In(m, y) //x=m(y)
rel Out(m, x) :− RtnStm(x, m) //x=m()

rel InvokeGlobal(m1: Mtd, m2: Mtd) :- isGlobal(m1, m2), CG(m1, m2)


def main(): {method,CG,AsgStm,IvkStm,RtnStm} & Impure = {
    //example
    let facts = {
    method("do()", "A")

    CG("foo()", "log()")
    CG("log()", "do()")
    CG("toy()", "do()")
    CG("source()", "foo()")

    AsgStm("r1", "source()")
    RtnStm("r1", "foo()")
    IvkStm("r3", "log()")
}
}
























/* elements of the mode lattice */
/*
enum Mode {
    case Top
    case Local,Global
    case Bot
}*/

/* the partial order */

/*The partial order is defined as a boolean valued
function of type leq : Mode x Mode → Bool which determines
when one element is less than or equal to another element.*/ 

//#reflexive #antiSymmetric #transitive
//#leastElement(Bot) #greatestElement(Top)
/*
def leq(e1: Mode, e2: Mode): Bool = match (e1, e2) with {
    case (Bot, _) => true
    case (Local, Local) => true
    case (Global, Global) => true
    case (_, Top) => true
    case _ => false
}*/

/* the least upper bound */
//#upperBound #leastUpperBound
/*
def lub(x: Mode, y: Mode): Mode = */

/* the greatest lower bound */
//#lowerBound #greatestLowerBound
/*
def glb(x: Mode, y: Mode): Mode = */
