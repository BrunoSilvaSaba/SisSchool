
<%@page import="java.util.Map"%>
<%@page import="br.sisacademico.pojo.Curso"%>
<%@page import="br.sisacademico.DAO.CursoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <jsp:include page="../menu.jsp"/>

        <%
            CursoDAO cDAO = new CursoDAO();
            Map<Curso, Integer> cursos = cDAO.getTodosCursos();
            int count = 1;
        %>
        
        <script>
            $(function () {
                $('[data-toggle="tooltip"]').tooltip()
            })
        </script>

        <div class="mt-5">
            <div style="width: 90%; margin: 0 auto !important;">
                <table class="table table-bordered text-center">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Curso</th>
                            <th scope="col">Tipo de Curso</th>
                            <th scope="col">Qtd. Alunos</th>
                            <th scope="col">Editar</th>
                            <th scope="col">Ver alunos</th>
                            <th scope="col">Excluir</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (Map.Entry<Curso, Integer> c : cursos.entrySet()) {
                        %>
                        <tr>
                            <td><%=count++%></td>
                            <td><%= c.getKey().getNomeCurso()%></td>
                            <td><%= c.getKey().getTipoCurso()%></td>
                            <td><%= c.getValue()%></td>
                            <td><a href="../cadastros/curso.jsp?idCurso=<%=c.getKey().getIdCurso()%>" class="btn btn-outline-info">Editar</a></td>
                            <%if (c.getValue() != 0) {%>
                            <td><a href="../relatorios/alunos.jsp?idCurso=<%=c.getKey().getIdCurso()%>" class="btn btn-outline-success">Alunos</a></td>
                            <%} else { %>
                            <td>
                                <span data-toggle="tooltip" title="Sem alunos para mostrar">
                                    <button class="btn btn-secondary btn-outline-secondary" disabled style="pointer-events: none;" type="button" disabled>Deletar</button>
                                </span>
                            </td>

                            <% } %>
                            
                            <%if (c.getValue() == 0) {%>
                            <td><a href="#" class="btn btn-outline-danger">Apagar</a></td>
                            <%} else { %>
                            <td>
                                <span data-toggle="tooltip" title="Não pode-se deletar um curso com alunos">
                                    <button class="btn btn-secondary btn-outline-secondary" disabled style="pointer-events: none;" type="button" disabled>Deletar</button>
                                </span>
                            </td>

                            <% } %>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
