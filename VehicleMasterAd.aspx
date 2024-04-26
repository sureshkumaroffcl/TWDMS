<%@ Page Title="" Language="C#" MasterPageFile="~/TWD/TWD_Admin/TWD_Admin.Master" AutoEventWireup="true" CodeBehind="VehicleMasterAd.aspx.cs" Inherits="TwoWheelerDealership.TWD.TWD_Admin.VehicleMasterAd" %>
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

  <!-- row open -->
    <div class="row">
        <div class="col-lg-4 col-md-6 col-12">
            <div class="card card-primary">
                <div class="card-header">
                    <h4>
                       Vehicle Master</h4>
                </div>
                <div class="card-body text-center">
                    <asp:Button ID="btnAdd" runat="server" Text="Add" class="btn btn-primary" onclick="btnAdd_Click"  />
                        
                </div>
            </div>
        </div>
    </div>
    <!-- row closed -->
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

                  
                       <%-- <asp:Label ID="lblVehicleID" runat="server" Text="Vehicle ID :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                        <asp:TextBox ID="txtVehicleID" runat="server" class="form-control"></asp:TextBox>
                    </div>--%>




                    <asp:Label ID="lblVehicleName" runat="server" Text="Vehicle Name :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                        <asp:TextBox ID="txtVehicleName" runat="server" class="form-control"></asp:TextBox>
                    </div>

                     <asp:Label ID="lblVehicleType" runat="server" Text="Vehicle Type :" class="col-md-2 col-form-label"></asp:Label>
                         <div class="col-md-4">
                        <asp:DropDownList ID="ddlVehicleType" runat="server" class="form-control">
                            <asp:ListItem Selected="True" Value="0">---------Select---------</asp:ListItem>
                            <asp:ListItem Value="1">Electric Scooter</asp:ListItem>
                            <asp:ListItem Value="2">Scooter</asp:ListItem>
                            <asp:ListItem Value="3">Bike</asp:ListItem>
                        </asp:DropDownList>
                    </div>


                    </div>


                     <div class="form-group row">

                  
                     <%--   <asp:Label ID="lblHallType" runat="server" Text="Hall Type :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                        <asp:TextBox ID="txtHallType" runat="server" class="form-control"></asp:TextBox>--%>

                       
                  
                   <asp:Label ID="lblCompanyName" runat="server" Text="Company Name :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                         <asp:DropDownList ID="ddlCompanyName" runat="server" class="form-control">
                            <asp:ListItem Selected="True" Value="0">---------Select---------</asp:ListItem>
                            <asp:ListItem Value="1">Kinetic Green</asp:ListItem>
                            <asp:ListItem Value="2">Honda</asp:ListItem>
                            <asp:ListItem Value="3">TVS</asp:ListItem>
                        </asp:DropDownList>
                   
                   </div>

                     <asp:Label ID="lblFuelType" runat="server" Text="Fuel Type :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                         <asp:DropDownList ID="ddlFuelType" runat="server" class="form-control">
                            <asp:ListItem Selected="True" Value="0">---------Select---------</asp:ListItem>
                            <asp:ListItem Value="1">Battery (Charge)</asp:ListItem>
                            <asp:ListItem Value="2">Petrol</asp:ListItem>
                           
                        </asp:DropDownList>
                   
                   </div>

                     
                    


                   
                   </div>
                       


                    <div class="form-group row">



                        <asp:Label ID="lblChasisNo" runat="server" Text="Chassis No :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                        <asp:TextBox ID="txtChasisNo" runat="server" class="form-control"></asp:TextBox>
                        </div>
                 <asp:Label ID="lblEngineNo" runat="server" Text="Engine No :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                        <asp:TextBox ID="txtEngineNo" runat="server" class="form-control"></asp:TextBox>
                        </div>
                       </div>
                  

                  <div class="form-group row">



                        <asp:Label ID="lblRange" runat="server" Text="Range :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                        <asp:TextBox ID="txtRange" runat="server" class="form-control"></asp:TextBox>
                        </div>
                 <asp:Label ID="lblWheelSize" runat="server" Text="Wheel Size :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                        <asp:TextBox ID="txtWheelSize" runat="server" class="form-control"></asp:TextBox>
                        </div>
                       </div>


                       <div class="form-group row">



                        <asp:Label ID="lblTyres" runat="server" Text="Tyres :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                       <asp:DropDownList ID="ddlTyres" runat="server" class="form-control">
                            <asp:ListItem Selected="True" Value="0">---------Select---------</asp:ListItem>
                            <asp:ListItem Value="1">Tubeless</asp:ListItem>
                            <asp:ListItem Value="2">Tube</asp:ListItem>
                           
                        </asp:DropDownList>
                        </div>
                 <asp:Label ID="lblLoadingCapacity" runat="server" Text="Loading Capacity :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                        <asp:TextBox ID="txtLoadingCapacity" runat="server" class="form-control"></asp:TextBox>
                        </div>
                       </div>




                       <div class="form-group row">



                        <asp:Label ID="lblFrontSuspension" runat="server" Text="Front Suspension :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                        <asp:TextBox ID="txtFrontSuspension" runat="server" class="form-control"></asp:TextBox>
                        </div>
                 <asp:Label ID="lblRearSuspension" runat="server" Text="Rear Suspension :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                        <asp:TextBox ID="txtRearSuspension" runat="server" class="form-control"></asp:TextBox>
                        </div>
                       </div>



                        <div class="form-group row">

                <asp:Label ID="lblDescription" runat="server" Text="Description :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                        <asp:TextBox ID="txtDescription" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
                        </div>

                        <asp:Label ID="lblWarranty" runat="server" Text="Warranty :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                         <asp:DropDownList ID="ddlWarranty" runat="server" class="form-control">
                            <asp:ListItem Selected="True" Value="0">---------Select---------</asp:ListItem>
                            <asp:ListItem Value="1">1 Year</asp:ListItem>
                            <asp:ListItem Value="2">2 Years</asp:ListItem>
                           <asp:ListItem Value="3">3 Years</asp:ListItem>
                           <asp:ListItem Value="4">4 Years</asp:ListItem>
                           <asp:ListItem Value="5">5 Years</asp:ListItem>
                        </asp:DropDownList>
                        </div>
                        </div>








                    
                    <div class="form-group row">

                    <asp:Label ID="lblPrice" runat="server" Text="Price :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                        <asp:TextBox ID="txtPrice" runat="server" class="form-control"></asp:TextBox>
                        </div>
                   
                   

                        <asp:Label ID="lblVehicleImg" runat="server" Text="Vehicle Image :" class="col-md-2 col-form-label"></asp:Label>
                        <div class="col-md-4">
                  
                        <asp:FileUpload ID="fuVehicleImg" runat="server" class="form-control"/>

                     
                       
                        </div>
                        </div>
                      

                   <%--  <asp:Label ID="lblStatus" runat="server" Text="Status:" class="col-md-2 col-form-label"></asp:Label>
                         <div class="col-md-4">
                        <asp:DropDownList ID="ddlStatus" runat="server" class="form-control">
                            <asp:ListItem Selected="True" Value="0">---------Select---------</asp:ListItem>
                            <asp:ListItem Value="1">AC</asp:ListItem>
                            <asp:ListItem Value="2">DC</asp:ListItem>
                        </asp:DropDownList>
                    </div>







                    </div>--%>



                    </form>
                    </div>
               
                <div class="modal-footer">
                    <asp:Button ID="btnSave" runat="server" Text="Save" class="btn btn-success"  OnClick="btnSave_Click"/>
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btn btn-secondary"  OnClick="btnCancel_Click"/>
                </div>
            </div>
        </div>
        </div>
    
    <!-- Message Modal closed -->

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
                        <asp:GridView ID="gvVehicleMaster" runat="server" 
                            AutoGenerateColumns="False" HorizontalAlign="Center"
                            AllowPaging="True" class="table table-bordered mb-0 text-nowrap " CellPadding="3"
                            CellSpacing="3" Width="100%" PageSize="10" OnPageIndexChanging="gvVehicleMaster_PageIndexChanging"
                            onselectedindexchanged="gvVehicleMaster_SelectedIndexChanged"  PagerSettings-Mode="NumericFirstLast">
                           
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



                                <asp:BoundField DataField="VehicleID" HeaderText="Vehicle No." 
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


                                <asp:BoundField DataField="ChasisNo" HeaderText="Chassis No." 
                                    SortExpression="Chassis No">
                                    <HeaderStyle CssClass="bg-primary" />
                                </asp:BoundField>

                                <asp:BoundField DataField="EngineNo" HeaderText="Engine No." 
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
