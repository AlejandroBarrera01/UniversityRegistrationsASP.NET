<%@ Page Title="" Language="C#" MasterPageFile="~/DecideRol.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="University.PestanasUni.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <%--Exit--%>

    <div class="row">
        <br />
        <div class="col-md-8">
            <asp:TextBox runat="server" ID="IdStuden" Visible="false"></asp:TextBox>          
                <h1>CONTACT US</h1>
        </div>

        <div class="col-md-4">

            <div class="col-md-4 col-md-offset-4">
                <asp:Label runat="server" ID="lbShow" ></asp:Label>
                <asp:Button runat="server" CssClass="btn btn-primary btn-sm" Text="Exit" OnClick="Unnamed_Click" />

            </div>
        </div>
    </div>
    
       <%-- The Contact side of the Website--%>

    <div class="form-group">
        <br />
        <h3>Online Customer Services</h3>
         <br />
        <div class="well well-lg">
 <p> If you’d like to place an order over the phone or have questions regarding your adidas.com order</p>
<p>8AM ET – 11PM ET, 7 days a week</p>
<p>800-982-9337<p />
<p>MiamiMD@edu.gov<p />
</div>
        <br />
        <h3>Financial Aid</h3>
         <div class="well well-lg">
<h4>Speak to a Counselor</h4>
<p>StudentLink Center</p/>
<p>5 MetroTech Center, Suite 201</p/>
<p>Broward, FL 33242</p/>

<h4>Student Services Center</h4>
<p>25 West 4th Street First Floor</p/>
<p>Miami, FL 23423</p/>
<h4>Phone or Email</h4>
<p>Financial Aid Number: 212.998.4444</p/>
<p>financial.aid@um.edu</p/>
<p>Registrar General Number: 212.998.4800</p/>
<p>registrar@um.edu</p/>
<p>Bursar General Number: 212.998.2806</p/>
<p>bursar.studentaccounts@um.edu</p/>
</div>

        </div>
</asp:Content>
