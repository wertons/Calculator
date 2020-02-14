package calculator.project;

public class Calculator {

    String operator;

    public Calculator() {
    }

    public String currentInput(String acumulado) {
        return acumulado;
    }

    public Double add(Double op1, Double op2) {
        return op1 + op2;
    }

    public Double sub(Double op1, Double op2) {
        return op1 - op2;
    }

    public Double mult(Double op1, Double op2) {
        return op1 * op2;
    }

    public Double div(Double op1, Double op2) {
        return op1 / op2;
    }

    public static void main(String[] args) {

    }

    public void getOp(String button) {

        if (button.equals("+")) {
            setOperator("+");

        } else if (button.equals("-")) {
            setOperator("-");

        } else if (button.equals("x")) {
            setOperator("*");

        } else if (button.equals("/")) {
            setOperator("/");

        } else if (button.equals(".")) {
            setOperator(".");

        }

    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }
}
