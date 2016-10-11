<%@ Page Title="" Language="C#" MasterPageFile="~/DecideRol.Master" AutoEventWireup="true" CodeBehind="SchoolAdvisor.aspx.cs" Inherits="University.PestanasUni.SchoolAdvisor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="row">
        <br />
        <div class="col-md-8">
            <asp:TextBox runat="server" ID="IdStuden" Visible="false"></asp:TextBox>
            <h2>Register Advisors</h2>          
       </div>
        <div class="col-md-4">
            <div class="col-md-4 col-md-offset-4">
                <asp:Label runat="server" ID="lbShow" ></asp:Label>
                <asp:Button runat="server" CssClass="btn btn-primary btn-sm" Text="Exit" OnClick="Unnamed_Click1" />
            </div>
        </div>
    </div>
    

    

    <div class="container-fluid">
    <div class="form-horizontal">
    <div class="panel panel-default">
        <br />
        <%--Registration field of the Advisors--%>

    <div class="form-group">
        <asp:Label runat="server" for="inputEmail" CssClass="col-md-2 control-label">Advisor ID</asp:Label>
        <div class="col-md-10">
            <asp:TextBox runat="server" type="text" CssClass="form-control" ID="txtAdvisorID" placeholder="ID"></asp:TextBox>
        </div>
    </div>
   
     <div class="form-group">
        <asp:Label runat="server" for="inputEmail" CssClass="col-md-2 control-label">Name</asp:Label>
        <div class="col-md-10">
            <asp:TextBox runat="server" type="text" CssClass="form-control" ID="txtAdvisorName" placeholder="Name"></asp:TextBox>
        </div>
    </div>

     <div class="form-group">
        <asp:Label runat="server" for="inputEmail" CssClass="col-md-2 control-label">Last Name</asp:Label>
        <div class="col-md-10">
            <asp:TextBox runat="server" type="text" CssClass="form-control" ID="txtAdvisorLastname" placeholder="Last Name"></asp:TextBox>
        </div>
    </div>

    <div class="form-group">
        <asp:Label runat="server" for="inputEmail" CssClass="col-md-2 control-label">Username</asp:Label>
        <div class="col-md-10">
            <asp:TextBox runat="server" type="text" CssClass="form-control" ID="txtAdvisorUsername" placeholder="Username"></asp:TextBox>
        </div>
    </div>

      <div class="form-group">
        <asp:Label runat="server" for="inputEmail" CssClass="col-md-2 control-label">Password</asp:Label>
        <div class="col-md-10">
            <asp:TextBox runat="server" type="text" CssClass="form-control" ID="txtAdvisorPassword" placeholder="Password"></asp:TextBox>
        </div>
    </div>

       <div class="form-group">
        <asp:Label runat="server" for="inputEmail" CssClass="col-md-2 control-label">User ID</asp:Label>
        <div class="col-md-10">
            <asp:TextBox runat="server" type="text" CssClass="form-control" ID="txtUserID" placeholder="User ID"></asp:TextBox>
        </div>
    </div>

         <div class="form-group">
        <asp:Label runat="server" for="inputEmail" CssClass="col-md-2 control-label">Email</asp:Label>
        <div class="col-md-10">
            <asp:TextBox runat="server" type="text" CssClass="form-control" ID="txtAdvisorEmail" placeholder="Email"></asp:TextBox>
        </div>
    </div>


         <div class="form-group">
        <asp:Label runat="server" for="inputEmail" CssClass="col-md-2 control-label">Mobile Phone #</asp:Label>
        
        <div class="col-md-10">
            <asp:TextBox runat="server" type="text" CssClass="form-control" ID="txtAdvisorPhone" placeholder="Phone #"></asp:TextBox>
        </div>
        </div>

      <%--  Button--%>

         <div class="form-group">
            <div class="col-lg-10 col-lg-offset-2">
                <asp:Button OnClick="Unnamed_Click" runat="server" Text="Submit" class="btn btn-primary" />

            </div>
          
        </div>

</div>
</div>
</div>
      
      

     <br />

 <%--   Table --%>

         <div class="form-Horizontal">
        <asp:GridView runat="server" ID="AdvisorDv" CssClass="table table-hover table-striped" GridLines="None"
        AutoGenerateColumns="false" OnRowEditing="AdvisorDv_RowEditing" OnRowCancelingEdit="AdvisorDv_RowCancelingEdit"
            OnRowUpdating="AdvisorDv_RowUpdating" DataKeyNames="Id_Advisor" OnRowDeleting="AdvisorDv_RowDeleting">
            <Columns>


                <asp:BoundField HeaderText="Id Advisor" DataField="Id_Advisor" ReadOnly="true" />

                <asp:TemplateField HeaderText="Name" Visible="true">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="name" Text='<%# Eval("Name") %>'> </asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtAdvisorName" runat="server" Text='<%# Eval ("Name") %>'> </asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="LastName" Visible="true">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="LastName" Text='<%# Eval("LastName") %>'> </asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtAdvisorLastName" runat="server" Text='<%# Eval ("LastName") %>'> </asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Email" Visible="true">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="Email" Text='<%# Eval("Email") %>'> </asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtAdvisorEmail" runat="server" Text='<%# Eval ("Email") %>'> </asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Contact" Visible="true">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="Contact" Text='<%# Eval("Contact#") %>'> </asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtAdvisorPhone" runat="server" Text='<%# Eval ("Contact#") %>'> </asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Delete">
            <ItemTemplate>
                <asp:LinkButton ID="lnkdelete" runat="server" Text="Delete" CommandName="Delete"></asp:LinkButton>
            </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Edit">
            <ItemTemplate>
                <asp:LinkButton ID="lnkedit" runat="server" Text="Edit" CommandName="Edit"></asp:LinkButton>
           </ItemTemplate>
            <EditItemTemplate>
                <asp:LinkButton runat="server" ID="lnkModify" Text="Modify" CommandName="Update"></asp:LinkButton>
                <asp:LinkButton runat="server" ID="lnkCancel" Text="Cancel" CommandName="Cancel"></asp:LinkButton>
           </EditItemTemplate>
           </asp:TemplateField>

            </Columns>
        </asp:GridView>
     </div>

    

         
         



</asp:Content>
