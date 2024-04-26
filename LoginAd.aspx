<%@ Page Title="" Language="C#" MasterPageFile="~/TWD/TWD_Admin/TWD_Admin.Master" AutoEventWireup="true" CodeBehind="LoginAd.aspx.cs" Inherits="TwoWheelerDealership.TWD.TWD_Admin.LoginAd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="app" class="page">
			<section class="section ">
                <div class="container">
					
                    <!--single-page open-->
						<div class="single-page">
							
								<div class="wrapper wrapper2 ">
									<div class="card-body ">
										<h4 class="text-primary">Login</h4>
                                        <h4>Hello! let's get started</h4>
                <h6 class="font-weight-light">Sign in to continue.</h6>
                                        
										<div class="form-group row">
                                              <asp:TextBox ID="txtLogin" runat="server" class="form-control border-primary" style="border-width:2px" placeholder="User Name"></asp:TextBox>
											
										</div>
                                     
                                        
										<div class="form-group row">
                                        <asp:TextBox ID="txtPasswd" runat="server" class="form-control border-primary" style="border-width:2px" placeholder="Password" TextMode="Password"></asp:TextBox>
											
										</div>
                                       
                                    
                                    <p class="mb-3 text-right"><a href="forgot.html">Forgot Password</a></p><div class="submit"> 
							
										<div class="form-group row">
                                        <div class="col-md-5 ml-auto">
                            <asp:Button ID="btnLogin" runat="server" Text="Login" class=" btn btn-primary btn-block" OnClick="btnLogin_Click"></asp:Button>
                            </div>

                             <div class="col-md-5">
								<asp:Button ID="btnCancel" runat="server" Text="Cancel" class=" btn btn-danger btn-block"  OnClick="btnCancel_Click"></asp:Button>			
										</div>
                                        </div>

                                        
										
                                        <p class="text-dark mb-0">Don't have account?<a href="#" class="text-primary ml-1">Sign UP</a></p>
									</div>
								
								</div>
							</div>
				
						<!--single-page closed-->
                      
				</div>
                </div>
			</section>
            
		</div>
		<!--app closed-->
</asp:Content>
 
 
