<%@ Page Title="" Language="C#" MasterPageFile="~/TWD/TWD_Admin/TWD_Admin.Master" AutoEventWireup="true" CodeBehind="VehicleSalesAd.aspx.cs" Inherits="TwoWheelerDealership.TWD.TWD_Admin.VehicleSalesAd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
<!--app-content open-->
    <!--page-header open-->
    <div class="page-header">
        <ol class="breadcrumb">
            <!-- breadcrumb -->
            <li class="breadcrumb-item"><a href="#"><i class="  fe fe-truck hor-icon mr-2"></i>Vehicle Sales
               </a></li>
            <%--<li class="breadcrumb-item active" aria-current="page">Modals</li>--%>
        </ol>
        <!-- End breadcrumb -->
        
    </div>
<!--page-header closed-->

<!-- Card Modal open -->
    <div class="row">
        <div class="col-lg-4 col-md-6 col-12">
            <div class="card card-primary">
                <div class="card-header">
                    <h4>
                        Vehicle Sales</h4>
                </div>
                <div class="card-body text-center">
                    <asp:Button ID="btnAdd" runat="server" Text="Add" class="btn btn-primary" OnClick="btnAdd_Click" />
                </div>
            </div>
        </div>
    </div>
    <!-- Card Modal Closed -->
    <!-- Message Modal Open-->
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
                    <form class="form-horizontal">
                    <div class="form-group row">
                        <%-- <asp:Label ID="lblSalesID" runat="server" Text="Sales ID :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                        <asp:TextBox ID="txtSalesID" runat="server" class="form-control"></asp:TextBox>
                    </div>--%>

                    <asp:Label ID="lblCusID" runat="server" Text="Customer Name :" class="col-md-2 col-form-label"></asp:Label>
                         <div class="col-md-4">
                         <asp:DropDownList ID="ddlCusID" runat="server" class="form-control" 
                                 DataSourceID="sqldsCustomer" DataTextField="CusName" 
                                 DataValueField="CusID" AppendDataBoundItems="True" >
                                <asp:ListItem Text="----Select----" Value="0" Selected="True"></asp:ListItem>
                                </asp:DropDownList>
       
                             <asp:SqlDataSource ID="sqldsCustomer" runat="server" 
                                 ConnectionString="<%$ ConnectionStrings:VehicleConn %>" 
                                 SelectCommand="SELECT [CusID], [CusName] FROM [tblCustomer]">
                             </asp:SqlDataSource>

                             
                             </div>
                               <%--OnSelectedIndexChanged="ddlVehicleID_SelectedIndexChanged"--%>


                              <asp:Label ID="lblVehicleID" runat="server" Text="Vehicle Name :" class="col-md-2 col-form-label"></asp:Label>
                         <div class="col-md-4">

                         <asp:DropDownList ID="ddlVehicleID" runat="server" class="form-control" 
                                 DataSourceID="sqldsVehicleMaster" DataTextField="VehicleName" 
                                 DataValueField="VehicleID" 
                         
                                 AppendDataBoundItems="True">
                                  <asp:ListItem Text="----Select----" Value="0" Selected="True"></asp:ListItem>
                                 
                                 </asp:DropDownList>

                             <asp:SqlDataSource ID="sqldsVehicleMaster" runat="server" 
                                 ConnectionString="<%$ ConnectionStrings:VehicleConn %>" 
                                 SelectCommand="SELECT [VehicleID], [VehicleName] FROM [tblVehicleMaster]">
                             </asp:SqlDataSource>

                         </div>
                    
                     </div>

                     <div class="form-group row">

                     <asp:Label ID="lblEmpID" runat="server" Text="Employee Name :" class="col-md-2 col-form-label"></asp:Label>
                         <div class="col-md-4">
                         <asp:DropDownList ID="ddlEmpID" runat="server" class="form-control" 
                                 DataSourceID="sqldsEmployee" DataTextField="EmpName" DataValueField="EmpID" AppendDataBoundItems="True">
                                  <asp:ListItem Text="----Select----" Value="0" Selected="True"></asp:ListItem>
                                 
                                 </asp:DropDownList>
    
   
                             <asp:SqlDataSource ID="sqldsEmployee" runat="server" 
                                 ConnectionString="<%$ ConnectionStrings:VehicleConn %>" 
                                 SelectCommand="SELECT [EmpID], [EmpName] FROM [tblEmployee]">
                             </asp:SqlDataSource>
                             </div>

                              <asp:Label ID="lblSalesDate" runat="server" Text="Sales Date :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                        <asp:TextBox ID="txtSalesDate" runat="server" class="form-control" name="date"  TextMode="Date"></asp:TextBox>
                    </div>
                    </div>

                     <div class="form-group row">


                     


                      <asp:Label ID="lblSalesPrice" runat="server" Text="Sales Price :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtSalesPrice" runat="server" class="form-control" ></asp:TextBox>
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

    <!-- Message Modal Closed -->


    <!-- GridView Open -->

    

    <div class="row">
        <div class="col-lg-12">
            <div class="card card-primary">
                <div class="card-header">
                    <h4>
                        Vehicle Sales Details</h4>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <asp:GridView ID="gvVehicleSales" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center" 
                            AllowPaging="True" class="table table-bordered mb-0 text-nowrap " CellPadding="3"
                            CellSpacing="3" Width="100%" AutoPostBack="true" 
                            onselectedindexchanged="gvVehicleSales_SelectedIndexChanged"  >
                            
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        S.No
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:TemplateField>

                                <asp:BoundField DataField="SalesID" HeaderText="Sales No." 
                                    SortExpression="Customer ID" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>

                               
       
        <asp:TemplateField HeaderText="Customer Name" HeaderStyle-CssClass="bg-primary">
            <ItemTemplate>
                <asp:Label ID="CusName" runat="server" Text='<%# Eval("CusName") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>



        <asp:TemplateField HeaderText="Vehicle Name" HeaderStyle-CssClass="bg-primary">
            <ItemTemplate>
                <asp:Label ID="vehicleName" runat="server" Text='<%# Eval("VehicleName") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>


       
        <asp:TemplateField HeaderText="Employee Name" HeaderStyle-CssClass="bg-primary">
            <ItemTemplate>
                <asp:Label ID="EmpName" runat="server" Text='<%# Eval("EmpName") %>' ></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:BoundField DataField="SalesDate" HeaderText="Sales Date" 
                                    SortExpression="Sales Date" DataFormatString="{0:dd-MM-yyyy}">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>


                                  <asp:BoundField DataField="SalesPrice" HeaderText="Sales Price" 
                                    SortExpression="Sales Price" DataFormatString="{0:0.00}">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>


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






<%--<script type="text/javascript">
       $(document).ready(function () {
           $("#<%= ddlVehicleID.ClientID %>").change(function () {
               var salesPrice = $("#<%= txtSalesPrice.ClientID %>");
               var selectedVehicleId = $(this).val();
               $.ajax({
                   type: "POST",
                   url: "VehicleSalesAd.aspx/GetSalesPrice",
                   data: '{VehicleID:' + selectedVehicleId + '}',
                   contentType: "application/json; charset=utf-8",
                   dataType: "json",
                   success: function (response) {
                       salesPrice.val(response.d);
                   },
                   failure: function (response) {
                       alert("Failed to fetch sales price of the vehicle.");
                   }
               });
           });
       });
</script>--%>


  <%--<asp:SqlDataSource ID="sqldsSalesPrice" runat="server" 
                             ConnectionString="<%$ ConnectionStrings:VehicleConn %>" 
                             ProviderName="<%$ ConnectionStrings:VehicleConn.ProviderName %>" 
                             
                             SelectCommand="SELECT Price FROM tblVehicleMaster WHERE (VehicleID = @VehicleID)">
                             <SelectParameters>

    <asp:ControlParameter ControlID="ddlVehicleID" Name="VehicleID" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />
</SelectParameters>
                             
                             
                             </asp:SqlDataSource>--%>