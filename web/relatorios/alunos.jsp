<%@page import="br.sisacademico.pojo.Curso"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.sisacademico.pojo.Aluno"%>
<%@page import="br.sisacademico.DAO.AlunoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="../menu.jsp"/>

        <%
            AlunoDAO aDAO = new AlunoDAO();
            ArrayList<Aluno> alunos;
            if (request.getParameter("idCurso") != null) {
                int idCurso = Integer.parseInt(request.getParameter("idCurso"));
                alunos = aDAO.getTodosAluno(Curso.class, idCurso);
            } else {
                alunos = aDAO.getTodosAluno(Aluno.class);

            }
            int index = 1;

        %>

        <div class="mt-5">
            <div style="width: 90%; margin: 0 auto !important;">
                <table class="table table-bordered text-center">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">RA</th>
                            <th scope="col">Nome do Aluno</th>
                            <th scope="col">Curso</th>
                            <th scope="col">Tipo de Curso</th>
                            <th scope="col">Editar</th>
                            <th scope="col">Excluir</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Aluno a : alunos) {%>
                        <tr>
                            <td><%=index++%></td>
                            <td><%=a.getRa()%></td>
                            <td><%=a.getNomeAluno()%></td>
                            <td><%=a.getCurso().getNomeCurso()%></td>
                            <td><%=a.getCurso().getTipoCurso()%></td>
                            <td><a href="../cadastros/aluno.jsp?idAluno=<%=a.getIdAluno()%>" class="btn btn-outline-info">Editar</a></td>
                            <td><a href="#" class="btn btn-outline-danger">Apagar</a></td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
        </div>



    </body>
</html>
