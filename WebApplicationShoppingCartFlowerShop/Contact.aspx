<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebApplicationShoppingCartFlowerShop.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Get in Touch: We're Here to Help!</h2>
    <h3>Contact Us</h3>

    <div>
        <h3>Customer Support</h3>
        <strong>Phone Number</strong>   <a href="mailto:Support@example.com">0842360661</a><br />
        <strong>Support:</strong>   <a href="mailto:Support@example.com">Support@example.com</a><br />
    </div>

    <div>
        <h3>Address</h3>
    <address>
        Point One Beach<br />
        Durban, South Africa 3000<br />
    </address>
    </div>

    <div>
        <h3>Follow Us</h3>
        <p>Facebook: <a href="[Facebook Page Link]">Facebook Page</a></p>
        <p>Twitter: <a href="[Twitter Page Link]">Twitter Page</a></p>
        <p>Instagram: <a href="[Instagram Page Link]">Instagram Page</a></p>
    </div>

<div class="col-md-2">
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
        <script type ="text/javascript">
            function InitializeMap()
            {
            var latlng = new google.maps.LatLng(-29.803118515106902, 30.986657968814605);
            var myOptions = {
                zoom: 15,
                center: latlng,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var map = new google.maps.Map(document.getElementById("map"), myOptions);
            }
            window.onload = InitializeMap;
        </script>

<div id ="map"   style="width: 400px; top: -300px; left: 700px; position: absolute; height: 250px">
</div>
</div>

<center> We value your feedback and are dedicated to continuously improving our services. 
Please don't hesitate to reach out to us with any questions or concerns. <br />
We look forward to hearing from you and providing you with an exceptional shopping experience at AfriMart. </center>

</asp:Content>
