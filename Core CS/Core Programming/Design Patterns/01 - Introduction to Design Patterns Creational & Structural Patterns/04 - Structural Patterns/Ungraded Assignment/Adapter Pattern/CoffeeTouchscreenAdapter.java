public class CoffeeTouchscreenAdapter implements CoffeeMachineInterface {
  private OldCoffeeMachine oldCoffeeMachine;
  
  public CoffeeTouchscreenAdapter (OldCoffeeMachine newMachine) {
    oldCoffeeMachine = newMachine;
  }

  public void chooseFirstSelection() {
    oldCoffeeMachine.selectA();
  }

  public void chooseSecondSelection() {
    oldCoffeeMachine.selectB();
  } 
}
