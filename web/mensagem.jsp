<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <jsp:include page="menu.jsp"/>

        <%
            //parametros da URL:
            String operacao = request.getParameter("op");
            String entidade = request.getParameter("entity");
            boolean resultado = Boolean.parseBoolean(request.getParameter("result"));

            if (operacao.equalsIgnoreCase("inclusao")) {
                operacao = "inclusão";
            }
        %>

        <div class="container mt-5">
            <div style="width: 80%; margin: 0 auto !important; text-align: center;">
                <%                    
                    if (resultado) {
                        if (entidade.equalsIgnoreCase("curso")) {
                            out.print("<h4>A operação de " + operacao + " do curso foi realizada com sucesso!</h4>");
                        }
                        
                        if (entidade.equalsIgnoreCase("aluno")){
                            out.print("<h4>A operação de " + operacao + " de aluno foi realizada com sucesso!</h4>");
                        }
                    } else {
                        if (entidade.equalsIgnoreCase("curso")) {
                            out.print("<h4>A operação de " + operacao + "do curso não foi bem sucedida!</h4>");
                        }
                        if (entidade.equalsIgnoreCase("aluno")) {
                            out.print("<h4>A operação de " + operacao + "do aluno não foi bem sucedida!</h4>");
                        }
                    }

                %>
            </div>
        </div>
    </body>
</html>
