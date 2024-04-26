<%@ Page Title="" Language="C#" MasterPageFile="~/TWD/TWD_Admin/TWD_Admin.Master" AutoEventWireup="true" CodeBehind="VehicleMasterReport.aspx.cs" Inherits="TwoWheelerDealership.TWD.TWD_Admin.VehicleMasterReport1" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<!--app-content open-->
    <!--page-header open-->
    <div class="page-header">
        <ol class="breadcrumb">
            <!-- breadcrumb -->
            <li class="breadcrumb-item"><a href="#"><i class="  fe fe-grid hor-icon mr-2"></i>Vehicle Master</a></li>
            <%--<li class="breadcrumb-item active" aria-current="page">Modals</li>--%>
        </ol>
        <!-- End breadcrumb -->
        <!--page-header closed-->
    </div>

     <!-- GridView Open -->
    
     <div class="row">
        <div class="col-lg-12">
            <div class="card card-primary">
                <div class="card-header">
                    <h4>
                        Vehicle Details</h4>
                </div>
                <div class="card-body">
                    <div class="table-responsive">

                     <div id="example_filter" class="dataTables_filter">

                        <asp:Label ID="lblSearch" runat="server" Text="Search :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                        <asp:TextBox ID="txtSearch" runat="server" class="form-control form-control-sm" AutoPostBack="True"
                        
                        OnTextChanged="txtSearch_TextChanged"></asp:TextBox>
                        </div>
                        </div>

                        <br />
                        <br />


                        <asp:GridView ID="gvVehicleMaster" runat="server" 
                            AutoGenerateColumns="False" HorizontalAlign="Center"
                            AllowPaging="True" class="table table-bordered mb-0 text-nowrap " CellPadding="3"
                            CellSpacing="3" Width="100%" PageSize="10" OnPageIndexChanging="gvVehicleMaster_PageIndexChanging"
                              PagerSettings-Mode="NumericFirstLast">
                           
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



                                <asp:BoundField DataField="VehicleID" HeaderText="Vehicle ID" 
                                    SortExpression="Vehicle ID" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>

                                 
                               

                                
                                <asp:BoundField DataField="VehicleName" HeaderText="Vehicle Name" 
                                    SortExpression="Vehicle Name">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>

                              
                               <asp:BoundField DataField="VehicleType" HeaderText="Vehicle Type" 
                                    SortExpression="Vehicle Type">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>

                               <asp:BoundField DataField="CompanyName" HeaderText="Company Name" 
                                    SortExpression="Company Name">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>

                                <asp:BoundField DataField="FuelType" HeaderText="Fuel Type" 
                                    SortExpression="Fuel Type">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>


                                <asp:BoundField DataField="ChasisNo" HeaderText="Chassis No" 
                                    SortExpression="Chassis No">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>

                                <asp:BoundField DataField="EngineNo" HeaderText="Engine No" 
                                    SortExpression="Engine No">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>

                                <asp:BoundField DataField="Range" HeaderText="Range" 
                                    SortExpression="Range">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>

                                <asp:BoundField DataField="WheelSize" HeaderText="Wheel Size" 
                                    SortExpression="Wheel Size">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>

                                <asp:BoundField DataField="Tyres" HeaderText="Tyres" 
                                    SortExpression="Tyres">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>

                                <asp:BoundField DataField="LoadingCapacity" HeaderText="Loading Capacity" 
                                    SortExpression="Loading Capacity">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>

                                
                                <asp:BoundField DataField="FrontSuspension" HeaderText="Front Suspension" 
                                    SortExpression="Front Suspension">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>

                                <asp:BoundField DataField="RearSuspension" HeaderText="Rear Suspension" 
                                    SortExpression="Rear Suspension">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>



                                 <asp:BoundField DataField="Description" HeaderText="Description" 
                                    SortExpression="Description" >
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>
                               

                                  <asp:BoundField DataField="Warranty" HeaderText="Warranty" 
                                    SortExpression="Warranty"  >
                                    <HeaderStyle CssClass="bg-primary"   />
                                </asp:BoundField>

                                <asp:BoundField DataField="Price" HeaderText="Price" 
                                    SortExpression="Price" DataFormatString="{0:0.00}">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>

                                 

                                 <asp:TemplateField HeaderText="Vehicle Image" HeaderStyle-CssClass="bg-primary">
                        <ItemTemplate>
                            <asp:Image ID="ImgVehicle" runat="server" ImageUrl= '<%# (string) FormatImageUrl((string) Eval("VehicleImage"))  %>'  Height="80px" Width="100px" />
                          
                          
                        </ItemTemplate>


<HeaderStyle CssClass="bg-primary"></HeaderStyle>


                        </asp:TemplateField>
                              <%--  <asp:ImageField DataImageUrlField="HallImage" HeaderText="Hall Image" 
                                    SortExpression="Hall Image">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:ImageField>--%>

                                <%--<asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:Button ID="btnEdit" runat="server" CommandName="Select" Text="Edit" class="btn btn-action btn-primary"
                                            CausesValidation="False" UseSubmitBehavior="False" />
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>

<div class="card-footer">
    <div class="mb-0">
    <div class ="pull-right">

   

        <asp:Button ID="btnPrint" runat="server" Text="Print" 
            class="btn btn-primary m-b-5 m-t-5" onclick="btnPrint_Click" />
    <CR:CrystalReportViewer ID="rptvewVehicleMaster" runat="server" AutoDataBind="true" />

     </div>
      
    
    </div>
        
    
    </div>




            </div>
        </div>
    </div>


        <!-- GridView Closed -->

</asp:Content>
