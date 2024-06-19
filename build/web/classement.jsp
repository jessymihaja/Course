<%-- 
    Document   : classement
    Created on : 4 juin 2024, 01:32:40
    Author     : jessy
--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="detail.Classement_equipe" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    Classement_equipe c=new Classement_equipe();
    ArrayList<Classement_equipe> listeGlobal =c.getListeGlobal();
    ArrayList<Classement_equipe> listeJunior=c.getListeByCategorie(1);
    ArrayList<Classement_equipe> listeHomme=c.getListeByCategorie(3);
    ArrayList<Classement_equipe> listeFemme=c.getListeByCategorie(4);
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="assets/css/tablecss.css"/>
        <link rel="stylesheet" href="assets/css/form.css"/>
    </head>
    <body>
        <%@include file='navAdmin.jsp' %>
        <button onclick="generatePDF()" id="bouton" style="background-color: #ff6666;">certificat</button>
        <div class="tablediv">    
        <h3>Toute categorie</h3>
        <table border="1">
              <thead>
                  <tr>
                      <th>classement</th>
                      <th>equipe</th>
                      <th>points</th>
                  </tr>
              </thead>
              <tbody>
                  <% for(Classement_equipe classe: listeGlobal) { %>
                  <tr>
                      <td><%= classe.getClassementEquipe()%></td>
                      <td><a href="classementCoureur.jsp?idEquipe=<%= classe.getIdEquipe()%>"><%= classe.getNom()%></a></td>
                      <td><%= classe.getTotal_points()%></td>
                  </tr>
                  <% } %>
              </tbody>
          </table>
      </div>
      <div class="tablediv">         
         <h3>Junior</h3>
         <table border="1">
            <thead>
                <tr>
                    <th>classement</th>
                    <th>equipe</th>
                    <th>points</th>
                </tr>
            </thead>
            <tbody>
                <% for(Classement_equipe classe: listeJunior) { %>
                <tr id="table<%= classe.getClassementEquipe()%>">
                    <td><%= classe.getClassementEquipe()%></td>
                    <td><%= classe.getNom()%></td>
                    <td><%= classe.getTotal_points()%></td>
                </tr>
                <% } %>
            </tbody>
        </table>
      </div>
      <div class="tablediv">
         <h3>Homme</h3>
         <table border="1">
            <thead>
                <tr>
                    <th>classement</th>
                    <th>equipe</th>
                    <th>points</th>
                </tr>
            </thead>
            <tbody>
                <% for(Classement_equipe classe: listeHomme) { %>
                <tr id="table<%= classe.getClassementEquipe()%>">
                    <td><%= classe.getClassementEquipe()%></td>
                    <td><%= classe.getNom()%></td>
                    <td><%= classe.getTotal_points()%></td>
                </tr>
                <% } %>
            </tbody>
        </table>
      </div>
      <div class="tablediv">
            <h3>Femme</h3>
         <table border="1">
            <thead>
                <tr>
                    <th>classement</th>
                    <th>equipe</th>
                    <th>points</th>
                </tr>
            </thead>
            <tbody>
                <% for(Classement_equipe classe: listeFemme) { %>
                <tr id="table<%= classe.getClassementEquipe()%>">
                    <td><%= classe.getClassementEquipe()%></td>
                    <td><%= classe.getNom()%></td>
                    <td><%= classe.getTotal_points()%></td>
                </tr>
                <% } %>
            </tbody>
        </table>
      </div>
            <br>
      

    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/chart.js/dist/chart.umd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/chartjs-plugin-datalabels/2.2.0/chartjs-plugin-datalabels.min.js" integrity="sha512-JPcRR8yFa8mmCsfrw4TNte1ZvF1e3+1SdGMslZvmrzDYxS69J7J49vkFL8u6u8PlPJK+H3voElBtUCzaXj+6ig==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script> 
  <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.3/html2pdf.bundle.min.js"></script>

    <div class="chartContainer"> 
    <div class="chartCard">
        <div class="chartBox">
            <canvas id="chartGlobal"></canvas>
        </div>
    </div>

    <div class="chartCard">
        <div class="chartBox">
            <canvas id="chartJunior"></canvas>
        </div>
    </div>

    <div class="chartCard">
        <div class="chartBox">
            <canvas id="chartHomme"></canvas>
        </div>
    </div>

    <div class="chartCard">
        <div class="chartBox">
            <canvas id="chartFemme"></canvas>
        </div>
    </div>
    </div>
    <br><!-- comment -->
    
    <script>
        function createChart(ctx, labels, data) {
            return new Chart(ctx, {
                type: 'pie',
                data: {
                    labels: labels,
                    datasets: [{
                        label: "points",
                        data: data,
                        backgroundColor: [
                            'rgba(255, 26, 104, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(255, 159, 64, 0.2)',
                            'rgba(0, 0, 0, 0.2)'
                        ],
                        borderColor: [
                            'rgba(255, 26, 104, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(255, 159, 64, 1)',
                            'rgba(0, 0, 0, 1)'
                        ],
                        borderWidth: 1
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        datalabels: {
                            color: 'blue',
                            labels: {
                                title: {
                                    font: {
                                        weight: 'bold'
                                    }
                                },
                                value: {
                                    color: 'green'
                                }
                            }
                        }
                    }
                },
                plugins: [ChartDataLabels]
            });
        }

        // Data for charts
        const dataGlobal = {
            equipe: [],
            points: []
        };
        const dataHomme = {
            equipe: [],
            points: []
        };
        const dataJunior = {
            equipe: [],
            points: []
        };
        const dataFemme = {
            equipe: [],
            points: []
        };

        <% for (Classement_equipe classe: listeGlobal) { %>
            dataGlobal.equipe.push('<%= classe.getNom() %>');
            dataGlobal.points.push(<%= classe.getTotal_points() %>);
        <% } %>

        <% for (Classement_equipe classe: listeHomme) { %>
            dataHomme.equipe.push('<%= classe.getNom() %>');
            dataHomme.points.push(<%= classe.getTotal_points() %>);
        <% } %>

        <% for (Classement_equipe classe: listeJunior) { %>
            dataJunior.equipe.push('<%= classe.getNom() %>');
            dataJunior.points.push(<%= classe.getTotal_points() %>);
        <% } %>

        <% for (Classement_equipe classe: listeFemme) { %>
            dataFemme.equipe.push('<%= classe.getNom() %>');
            dataFemme.points.push(<%= classe.getTotal_points() %>);
        <% } %>

        // Create charts
        createChart(document.getElementById('chartGlobal').getContext('2d'), dataGlobal.equipe, dataGlobal.points);
        createChart(document.getElementById('chartHomme').getContext('2d'), dataHomme.equipe, dataHomme.points);
        createChart(document.getElementById('chartJunior').getContext('2d'), dataJunior.equipe, dataJunior.points);
        createChart(document.getElementById('chartFemme').getContext('2d'), dataFemme.equipe, dataFemme.points);
        
                // Set top team details
        document.getElementById('topTeam').innerText = dataGlobal.equipe[0];
        document.getElementById('topPoints').innerText = dataGlobal.points[0];

        // Generate PDF
        function generatePDF() {
        // Choose the element id which you want to export.
        var element = document.getElementById('divToExport');
        
        var opt = {
            margin:       0.5,
            filename:     'myfile.pdf',
            image:        { type: 'jpeg', quality: 1 },
            html2canvas:  { scale: 1 },
            jsPDF:        { unit: 'in', format: 'letter', orientation: 'portrait',precision: '12' }
          };
        
        // choose the element and pass it to html2pdf() function and call the save() on it to save as pdf.
        html2pdf().set(opt).from(element).save();
      }

    </script>
    <br><br><br><br><br><br><br><br><br><br><br><br><br>
<div id="divToExport" class="certificat" >
    <h3>Certificat de Nomination</h3>
    <h1 >Champion</h1>
    <h1 >Course</h1>
    <p style="width: 500px;margin-left: 250px">Cette attestation est décernée à l'équipe triomphante de <%=listeGlobal.get(0).getNom()%>, qui a émergé comme le champion incontesté. Leur dévouement, leur stratégie exceptionnelle et leur persévérance indomptable les ont guidés vers la gloire ultime. Avec <%=listeGlobal.get(0).getTotal_points()%> points glanés, ils ont laissé une empreinte indélébile dans l'histoire de la compétition. Félicitations pour cette victoire mémorable et pour avoir hissé l'étendard de l'excellence !"</p>
    <p>Equipe: <span id="topTeam"><%=listeGlobal.get(0).getNom()%></span></p>
    <p>Points: <span id="topPoints"><%=listeGlobal.get(0).getTotal_points()%></span></p>
    <span>signature _______________</span><span style="margin-left: 300px">Date _______________</span>  
</div>
    </body>
</html>
