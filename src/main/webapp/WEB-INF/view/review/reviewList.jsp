<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/head.jsp" %>
	<section id="content" style="width:1200px; margin:0 auto;">
	<article class="my-3" id="tables">
	<div class="bd-example-snippet bd-code-snippet">
	<div class="bd-example m-0 border-0">
        <table class="table table-striped">
          <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">First</th>
            <th scope="col">Last</th>
            <th scope="col">Handle</th>
          </tr>
          </thead>
          <tbody>
          <tr>
            <th scope="row">1</th>
            <td>Mark</td>
            <td>Otto</td>
            <td>@mdo</td>
          </tr>
          <tr>
            <th scope="row">2</th>
            <td>Jacob</td>
            <td>Thornton</td>
            <td>@fat</td>
          </tr>
          <tr>
            <th scope="row">3</th>
            <td colspan="2">Larry the Bird</td>
            <td>@twitter</td>
          </tr>
          </tbody>
        </table>
        </div></div>
        </article>
        <div class="bd-example-snippet bd-code-snippet" style="display:flex; justify-content:center;">
        <div class="bd-example m-0 border-0">
        <nav aria-label="Standard pagination example">
          <ul class="pagination">
            <li class="page-item">
              <a class="page-link text-dark" href="#" aria-label="Previous">
                <span aria-hidden="true">«</span>
              </a>
            </li>
            <li class="page-item"><a class="page-link text-dark" href="#">1</a></li>
            <li class="page-item"><a class="page-link text-dark" href="#">2</a></li>
            <li class="page-item active"><a class="page-link text-dark" href="#">3</a></li>
            <li class="page-item">
              <a class="page-link text-dark" href="#" aria-label="Next">
                <span aria-hidden="true">»</span>
              </a>
            </li>
          </ul>
        </nav>
        </div></div>
        </section>
        
<%@ include file="../inc/foot.jsp" %>