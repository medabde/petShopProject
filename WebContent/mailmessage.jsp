<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="javax.mail.MessagingException"%>
<%
    String result;
    final String to = request.getParameter("email");
    final String subject = request.getParameter("name");
    final String messg = request.getParameter("message");
    final String from = "wafaeissa17@gmail.com";
    final String pass = "witlkmpdmiyevbat";
    String host = "smtp.gmail.com";
    Properties props = new Properties();
    props.put("mail.smtp.host", host);

    props.put("mail.transport.protocol", "smtp");
    System.setProperty("https.protocols", "TLSv1.1");
    props.put("mail.smtp.auth", "true");

    props.put("mail.smtp.starttls.enable", "true");
    props.put("mail.user", from);

    props.put("mail.password", pass);

    props.put("mail.smtp.port", "587");
    

    Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {

        @Override

        protected PasswordAuthentication getPasswordAuthentication() {

            return new PasswordAuthentication(from, pass);

        }

    });

 

    try {


        MimeMessage message = new MimeMessage(mailSession);

        message.setFrom(new InternetAddress(from));

        message.addRecipient(Message.RecipientType.TO,

                new InternetAddress(to));


        message.setSubject(subject);

        message.setText(messg);

        Transport.send(message);

        result = "Your mail sent successfully....";

    } catch (MessagingException mex) {

        mex.printStackTrace();

        result = "Error: unable to send mail....";

    }

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>mail message</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
<div id="wrap">

       <jsp:include page="pageParts/head.jsp" flush="true">
		    <jsp:param name="page" value="myAccount"/>
		</jsp:include>
       
       <div class="center_content">
       	<div class="left_content">
            
              	<div class="contact_form">
                <div class="form_subtitle">Message:</div>
                <b style: color="green"><center><% out.println(result);%></b>
                </div>    

        <div class="clear"></div>
        </div><!--end of left content-->
        
        <%@include file="pageParts/side.jsp" %>
        
        
       
       
       <div class="clear"></div>
       </div><!--end of center content-->
       
              
       <%@include file="pageParts/footer.jsp" %>
    

</div>

</body>
</html>