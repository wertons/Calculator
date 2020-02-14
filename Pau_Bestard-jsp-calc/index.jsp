<%@page import="com.sun.tools.javac.util.StringUtils"%>
<%@ page language='java' contentType='text/html;charset=iso-8859-1' %>
<%@ page import='calculator.project.Calculator' %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Calculator</title>
        <link rel="stylesheet" href="./css/style.css">
    </head>

    <%
        Calculator calc = new Calculator();
        String button = request.getParameter("button");
        String acumulado = request.getParameter("acumulado");
        String op = request.getParameter("op");
        String result = request.getParameter("op");
        int currOp;

        if (op == null) {
            op = "";
        }
        if (result == null) {
            result = "";
        }
        if (request.getParameter("currOp") == null) {
            currOp = 1;
        } else {
            currOp = Integer.parseInt(request.getParameter("currOp"));

        }
        if (button == null) {
            button = "";
        }
        if (acumulado == null) {
            acumulado = "";
        }

        double op1 = 0.0;
        if (request.getParameter("ope1") != null) {
            op1 = Double.parseDouble(request.getParameter("ope1"));
        }
        double op2 = 0.0;
        if (request.getParameter("ope2") != null) {

            op2 = Double.parseDouble(request.getParameter("ope2"));
        }

        if (!button.equals("")) {
            try {
                if (Integer.parseInt(button) < 10 && Integer.parseInt(button) >= 0) {
                    if (currOp == 1) {
                        op1 = (op1 * 10) + Integer.parseInt(button);
                    } else if (currOp == 2) {
                        op2 = (op2 * 10) + Integer.parseInt(button);

                    }
                    acumulado = acumulado + button;

                }
            } catch (NumberFormatException e) {
                if (button.equals("=")) {
                    currOp = 2;

                    if (op.equals("+")) {
                        result = Double.toString(calc.add(op1, op2));

                    } else if (op.equals("-")) {
                        result = Double.toString(calc.sub(op1, op2));

                    } else if (op.equals("*")) {
                        result = Double.toString(calc.mult(op1, op2));

                    } else if (op.equals("/")) {
                        result = Double.toString(calc.div(op1, op2));

                    }

                    op1 = Double.parseDouble(result);
                    op2 = 0;
                    currOp = 1;
                } else {
                    currOp = 2;
                    calc.getOp(button);
                    op = calc.getOperator();

                }
            }

        }

    %>

    <body>

        <form  action="index.jsp">
            <p class="marca">Calculator</p>
            <br>
            <input type="textfield" name="current" value="<%out.println(op1 + " " + op + " " + op2); %>"  >
            <input type="hidden" value="<%out.print(acumulado);%>" name="acumulado">
            <input type="hidden" value="<%out.print(op1);%>" name="ope1">
            <input type="hidden" value="<%out.print(op2);%>" name="ope2">
            <input type="hidden" value="<%out.print(currOp);%>" name="currOp">
            <input type="hidden" value="<%out.print(op);%>" name="op">
            <input type="textfield" value="<%out.print(result);%>" name="result">





            <br>
            <input type="submit" value="7" name="button">
            <input type="submit" value="8" name="button">
            <input type="submit" value="9" name="button">
            <input type="submit" value="+" name="button">
            <br>
            <input type="submit" value="4" name="button">
            <input type="submit" value="5" name="button">
            <input type="submit" value="6" name="button">
            <input type="submit" value="-" name="button">
            <br>
            <input type="submit" value="1" name="button">
            <input type="submit" value="2" name="button">
            <input type="submit" value="3" name="button">
            <input type="submit" value="x" name="button">
            <br>
            <input type="submit" value="0" name="button">
            <input type="submit" value="C" name="button">
            <input type="submit" value="C" name="button">
            <input type="submit" value="/" name="button">
            <br>
            <input type="submit" value="=" name="button">
        </form>

    </body>
</html>