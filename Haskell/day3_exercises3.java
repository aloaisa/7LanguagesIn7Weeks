/** -- - -- - -- - -- - -- - -- - -- - -- 
* 
*  Language Haskell.
*  - Day 3
*  	Seven Languages in seven weeks
* 
* - -- - -- - -- - -- - -- - -- - -- - -- 
*  Implement a Monad in a nonfunctional language
**/


package alvaro.monad;

import java.util.ArrayList;
import java.util.List;

/*******************************
* Monad Class
*
*********************************/
public class Monad {

  private List content;

  private Monad(final List content) {
      this.content = new ArrayList(content);
  }
  
  Monad bind(Func func) {
      ArrayList res = new ArrayList();
      
      for (Object obj: content) {
          res.addAll(func.run(obj).getContent());
      }
      
      return new Monad(res);
  }
  
  static Monad wrap(Object obj) {
      ArrayList res = new ArrayList();
      res.add(obj);
      
      return new Monad(res);
  }
  
  static Monad fail(String error) {
      return new Monad(new ArrayList());
  }
  
  public List getContent() {
      return content;
  }

  interface Func {
      Monad run(Object obj);
  }    
  
  static Monad monadDo(List lst) {
      return new Monad(lst);
  }
  
  public static void main(String [] args) {
      List output = monadDo(Sequence.makeRange(1, 5)).bind(new Pair1()).getContent();
      
      for (Object obj: output) {
          System.out.println(obj);
      }
  }
}


/*******************************
* Pair1 Class
*
*********************************/
class Pair1 implements Monad.Func {
  public Monad run(Object obj) {
      Monad.Func func = new Pair2(obj);
      return Monad.monadDo(Sequence.makeRange(1, 5)).bind(func);
  }
}


/*******************************
* Pair2 Class
*
*********************************/
class Pair2 implements Monad.Func {
  private Object content;
  public Pair2(final Object obj) {
      this.content = obj;
  }
  
  public Monad run(Object obj) {
      Integer cont = (Integer) content;
      Integer val = (Integer) obj;
      if (cont.intValue() < val.intValue())
          return Monad.wrap(new Pair(content, obj));
      else
          return Monad.fail("Not valid!");
  }
}


/*******************************
* Sequence Class
*
*********************************/
class Sequence {
  static List makeRange(int from, int to) {
      ArrayList lst = new ArrayList();
      
      for (int i = from; i <= to; i++) lst.add(i);
      
      return lst;
  }
}


/*******************************
* Pair Class
*
*********************************/
class Pair {
  private Object fst;
  private Object snd;
  
  public Pair(final Object fst, final Object snd) {
      this.fst = fst;
      this.snd = snd;
  }
  
  public String toString() {
      return "(" + getFst() + ", " + getSnd() + ")";
  }

  public Object getFst() {
      return fst;
  }

  public Object getSnd() {
      return snd;
  }
} 
