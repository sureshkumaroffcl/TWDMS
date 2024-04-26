<%@ Page Title="" Language="C#" MasterPageFile="~/TWD/TWD_Admin/TWD_Admin.Master" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="TwoWheelerDealership.TWD.TWD_Admin.Employee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<!--app-content open-->
    <!--page-header open-->
    <div class="page-header">
        <ol class="breadcrumb">
            <!-- breadcrumb -->
            <li class="breadcrumb-item"><a href="#"><i class="  fe fe-users hor-icon mr-2"></i>Employee</a></li>
            <%--<li class="breadcrumb-item active" aria-current="page">Modals</li>--%>
        </ol>
        <!-- End breadcrumb -->
        <!--page-header closed-->
    </div>

    <!-- row open -->
    <div class="row">
        <div class="col-lg-4 col-md-6 col-12">
            <div class="card card-primary">
                <div class="card-header">
                    <h4>
                       Employee</h4>
                </div>
                <div class="card-body text-center">
                    <asp:Button ID="btnAdd" runat="server" Text="Add" class="btn btn-primary" onclick="btnAdd_Click"  />
                        
                </div>
            </div>
        </div>
    </div>

    <!-- Message Modal -->
     <div class="modal fade" id="exampleModal3" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="example-Modal3">
                    </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" >

                    <div class="form-group row">

                     <%-- <asp:Label ID="lblEmployeeID" runat="server" Text="Employee ID :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                        <asp:TextBox ID="txtEmployeeID" runat="server" class="form-control"></asp:TextBox>
                    </div>--%>


                    <asp:Label ID="lblEmpName" runat="server" Text=" Name :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                        <asp:TextBox ID="txtEmpName" runat="server" class="form-control"></asp:TextBox>
                    </div>

                    <asp:Label ID="lblEmpFatherName" runat="server" Text="Father Name :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                        <asp:TextBox ID="txtEmpFatherName" runat="server" class="form-control"></asp:TextBox>
                    </div>
                    
                      </div>

                      <div class="form-group row">

                      

                    <asp:Label ID="lblGender" runat="server" Text="Gender :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                         <asp:DropDownList ID="ddlGender" runat="server" class="form-control">
                            <asp:ListItem Selected="True" Value="0">---------Select---------</asp:ListItem>
                            <asp:ListItem Value="1">Male</asp:ListItem>
                            <asp:ListItem Value="2">Female</asp:ListItem>
                        </asp:DropDownList>
                        </div>
                        <asp:Label ID="lblDOB" runat="server" Text="Date of Birth :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                        <asp:TextBox ID="txtDOB" runat="server" class="form-control" name="date"  TextMode="Date"></asp:TextBox>
                    </div>


                        </div>

                        <div class="form-group row">

                        

                    <asp:Label ID="lblPhoneNo" runat="server" Text="Phone No:" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                        <asp:TextBox ID="txtPhoneNo" runat="server" class="form-control" TextMode="Phone" ></asp:TextBox>
                        </div>

                        <asp:Label ID="lblQualification" runat="server" Text="Qualification :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                        <asp:TextBox ID="txtQualification" runat="server" class="form-control"></asp:TextBox>
                    </div>


                    </div>

                    <div class="form-group row">

                     

                    <asp:Label ID="lblDesignation" runat="server" Text="Designation :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                        <asp:TextBox ID="txtDesignation" runat="server" class="form-control"></asp:TextBox>
                    </div>
                    <asp:Label ID="lblAddress" runat="server" Text="Address :" class="col-md-2 col-form-label"></asp:Label>
                         <div class="col-md-4">
                             <asp:TextBox ID="txtAddress" runat="server"  class="form-control"  TextMode="MultiLine"></asp:TextBox>
                             </div>



                    </div>

                    <div class="form-group row">

                          

                             <asp:Label ID="lblEmpImg" runat="server" Text="Employee Image :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                  
                        <asp:FileUpload ID="fuEmpImg" runat="server" class="form-control"/>

                        </div>
                        </div>

                        </form>
                    </div>
               
                <div class="modal-footer">
                    <asp:Button ID="btnSave" runat="server" Text="Save" class="btn btn-success"  OnClick="btnSave_Click"/>
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btn btn-secondary" OnClick="btnCancel_Click" />
                </div>
            </div>
        </div>
        </div>

        <!-- Message Modal closed -->

        <!-- GridView Open-->

        <div class="row">
        <div class="col-lg-12">
            <div class="card card-primary">
                <div class="card-header">
                    <h4>
                        Employee Details</h4>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <asp:GridView ID="gvEmployee" runat="server" 
                            AutoGenerateColumns="False" HorizontalAlign="Center"
                            AllowPaging="True" class="table table-bordered mb-0 text-nowrap " CellPadding="3"
                            CellSpacing="3" Width="100%" 
                            onselectedindexchanged="gvEmployee_SelectedIndexChanged" >
                            
                           
                            <Columns>


                             <asp:TemplateField>
                                    <HeaderTemplate >
                                        S.No
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="bg-primary"   />
                                </asp:TemplateField>



                                <asp:BoundField DataField="EmpID" HeaderText="Employee No." 
                                    SortExpression="Employee ID" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>

                                 
                               

                                
                                <asp:BoundField DataField="EmpName" HeaderText="Employee Name" 
                                    SortExpression="Employee Name">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>

                              
                               <asp:BoundField DataField="EmpFatherName" HeaderText="EmpFatherName" 
                                    SortExpression="EmpFatherName">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>

                               <asp:BoundField DataField="Gender" HeaderText="Gender" 
                                    SortExpression="Gender">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>

                                <asp:BoundField DataField="DOB" HeaderText="Date of Birth" 
                                    SortExpression="Date of Birth" DataFormatString="{0:dd-MM-yyyy}">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>


                                <asp:BoundField DataField="PhoneNo" HeaderText="Phone No." 
                                    SortExpression="Phone No" DataFormatString="{0:(###) ###-####}">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>

                                <asp:BoundField DataField="Qualification" HeaderText="Qualification" 
                                    SortExpression="Qualification">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>

                                <asp:BoundField DataField="Designation" HeaderText="Designation" 
                                    SortExpression="Designation">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>

                                <asp:BoundField DataField="Address" HeaderText="Address" 
                                    SortExpression="Address">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>

                              

                               <%-- <asp:ImageField DataImageUrlField="EmpImage" HeaderText="Employee Image"   ItemStyle-Height="80px" ItemStyle-Width="100px">
                                 <HeaderStyle CssClass="bg-primary" />
                                </asp:ImageField>
--%>
                                

                                <asp:TemplateField HeaderText="Employee Image" HeaderStyle-CssClass="bg-primary">
                                    <ItemTemplate>
                                        <asp:Image ID="ImgEmployee" runat="server" ImageUrl='<%# (string) FormatImageUrl( (string) Eval("EmpImage"))%>'
                                            Height="80px" Width="100px" />
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="bg-primary"></HeaderStyle>
                                </asp:TemplateField>

                              <%--  <asp:ImageField DataImageUrlField="HallImage" HeaderText="Hall Image" 
                                    SortExpression="Hall Image">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:ImageField>--%>

                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:Button ID="btnEdit" runat="server" CommandName="Select" Text="Edit" class="btn btn-action btn-primary"
                                            CausesValidation="False" UseSubmitBehavior="False" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- GridView Closed -->
</asp:Content>
