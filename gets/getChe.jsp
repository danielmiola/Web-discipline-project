<%@page import="autocomplete.autoCompleteServletChemical"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/javascript" %>

<%! public String autojournal;  %>
<%
    autoCompleteServletChemical db = new autoCompleteServletChemical();
 
    String query = request.getParameter("term");
    
     
    List<String> countries = db.getData(query);
 
   

    Iterator<String> iterator = countries.iterator();
    autojournal = "[";
     out.print(autojournal);
    while(iterator.hasNext()) {
        autojournal = "\"";
         out.print(autojournal);
        autojournal = (String)iterator.next();
        out.print(autojournal);
        if(iterator.hasNext()){
        autojournal = "\",";
        out.print(autojournal);  
        }
            
    }    
    System.out.println(autojournal);
    autojournal = "\"]";
    out.print(autojournal);
    
%>