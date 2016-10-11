<%@ Page Title="" Language="C#" MasterPageFile="~/DecideRol.Master" AutoEventWireup="true" CodeBehind="Aboutus.aspx.cs" Inherits="University.PestanasUni.Aboutus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <%--Exit--%>  

<div class="row">
        <br />
        <div class="col-md-8">
            <asp:TextBox runat="server" ID="IdStuden" Visible="false"></asp:TextBox>
           
                <h3>About The University </h3>
        </div>

        <div class="col-md-4">

            <div class="col-md-4 col-md-offset-4">
                <asp:Label runat="server" ID="lbShow" ></asp:Label>
                <asp:Button runat="server" CssClass="btn btn-primary btn-sm" Text="Exit" OnClick="Unnamed_Click" />

            </div>
        </div>
    </div>

    <%--image--%>
      <b />
    <img src="/images/schools.jpg"/ class="img-responsive center-block">

     <br />

    <%--The About Side of the page--%>
    <div class="form-group">
    <p>The University of Miami is a leading higher education and research institution near Miami, </p>
    <p>in the south of Florida. UM was the first of the new wave of Florida universities founded in the </p>
    <p>1960s, receiving its Royal Charter in 1961.</p>
        <br />
        <h3>Innovative research and scholarship</h3>
         <br />
        <p>Sussex is a leading research university, as reflected in the 2014 Research Excellence Framework (REF). Over 75 per cent</p>
        <p> of research activity at UM is categorised as world leading (4*) or internationally excellent (3*) in terms of originality, </p>
        <p>significance and rigour.</p>
        <br />
        <p>Individual highlights of the REF 2014 results include:</p>
        <br />
        <p>. Sussex History was the highest rated History submission in the Miami for the quality of its research outputs </p>
        <p>. The Sussex English submission rose from 31st to 9th across the Miami since the last research assessment exercise in 2008</p>
        <p>. 84 per cent of the University’s research impact in Psychology was rated as the top possible grade, 4* </p>
        <p>. UM Geography had the most 4* rated research impact of any Geography submission across the United States.</p>
        <br />
        <p>Overall, the University was placed 36th (of multi-disciplinary institutions) by GPA.</p>

        <h3>Our Staff</h3>
        <br />
        <p>UM has developed a reputation for innovation and inspiration, and attracts leading thinkers and researchers. We have </p>
        <p>over 2,100 staff, including around 1,000 teaching and research staff, of which, over 300 are research-only. We have </p>
        <p>counted three Nobel Prize winners, 14 Fellows of the Royal Society, 12 Fellows of the Miami Academy and a winner of the </p>
        <p>prestigious Crafoord Prize on our faculty.</p>
        </div>
</asp:Content>
