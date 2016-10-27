<%@ Page Title="" Language="C#" MasterPageFile="~/DecideRol.Master" AutoEventWireup="true" CodeBehind="Classes.aspx.cs" Inherits="University.PestanasUni.Classes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <br />
        <div class="col-md-8">
            <asp:TextBox runat="server" ID="IdStuden" Visible="false"></asp:TextBox> 
                    
                <h3>Pick Your Schedule </h3>          
        </div>
        <%--EXIT BUTTON --%>
        <div class="col-md-4">

            <div class="col-md-4 col-md-offset-4">
                <asp:Label runat="server" ID="lbShow" ></asp:Label>
                <asp:Button runat="server" CssClass="btn btn-primary btn-sm" Text="Exit" OnClick="Unnamed_Click1" />

            </div>
        </div>
    </div>
    
    <br />

   <%-- Registration Fields--%>

    <div class="container-fluid">
    <div class="form-Horizontal">
     <div class="row">
      <div class="col-md-6 col-md-offset-3">
        <div class="panel panel-default">
        <div class="panel-body">
            <div class="col-xs-6">                    
    <div class="form-group">
    <asp:Label runat="server"  CssClass="col-md-3 control-label" Text="Student ID" ></asp:Label>
    <div class="col-md-10">
    <asp:TextBox ID="txtID" runat="server" CssClass="form-control" placeholder="ID"></asp:TextBox>    
    </div>
     </div>
                <br />

                 <div class="form-group">
      <asp:Label runat="server"  CssClass="col-md-3 control-label" Text="Times" ></asp:Label>
      <div class="col-md-10">
      <asp:DropDownList runat="server" Cssclass="form-control" ID="Times">
      </asp:DropDownList>
      </div> 
      </div>
                <br />

                 <div class="form-group">
      <asp:Label runat="server"  CssClass="col-md-3 control-label" Text="Subject" ></asp:Label>
      <div class="col-md-10">
      <asp:DropDownList runat="server" Cssclass="form-control" ID="Subject">
      </asp:DropDownList>
      </div> 
      </div>
                                            
                </div>

            <div class="col-xs-6">
                 <div class="form-group">
      <asp:Label runat="server"  CssClass="col-md-3 control-label" Text="Teachers" ></asp:Label>
      <div class="col-md-10">
      <asp:DropDownList runat="server" Cssclass="form-control" ID="Teacher">
      </asp:DropDownList>
      </div> 
      </div>
                <br />

                 <div class="form-group">
      <asp:Label runat="server"  CssClass="col-md-3 control-label" Text="Location" ></asp:Label>
      <div class="col-md-10">
      <asp:DropDownList runat="server" Cssclass="form-control" ID="Location">
      </asp:DropDownList>
      </div> 
      </div>
                <br />

                 <div class="form-group">
      <asp:Label runat="server"  CssClass="col-md-4 control-label" Text="Quarter" ></asp:Label>
      <div class="col-md-10">
      <asp:DropDownList runat="server" Cssclass="form-control" ID="Quater">
      </asp:DropDownList>
      </div> 
      </div>
      

</div>
            <%--Checkboxes of the Days--%>

            <br />

            <div class="form-group">
      <label class="col-lg-1 control-label">Days</label>
      <div class="col-lg-11">
           <asp:CheckBox ID="Mon" Text="Mondays" runat="server"> </asp:CheckBox>
          <asp:CheckBox ID="Tues" Text="Tuesdays" runat="server"> </asp:CheckBox>
          <asp:CheckBox ID="Wed" Text="Wednesdays" runat="server"> </asp:CheckBox>
          <asp:CheckBox ID="Thur" Text="Thursdays" runat="server"> </asp:CheckBox>
          <asp:CheckBox ID="Fri" Text="Friday" runat="server"> </asp:CheckBox>
        
          
            
   

   </div>
     </div>
            <%--Button--%>

              <div class="form-group">
      <div class="col-md-offset-2 col-md-10">
      <asp:Button OnClick="Unnamed_Click" runat="server" Text="Submit" CssClass="btn btn-primary" />
      </div>
      </div>
           
</div>
           
      </div>
            <br />

            
    </div>
           <br />

         <%--DataGrid--%>

         <div class="form-Horizontal">         
        <asp:GridView runat="server" ID="GridViewShow" CssClass="table table-hover table-striped" GridLines="None"></asp:GridView>
     </div>

     </div>
      </div>
       </div>




</asp:Content>
