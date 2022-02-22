
    var express = require('express');  
    var mysql = require('mysql');  
    var bodyParser=require('body-parser');  
      
    var urlencoderParser = bodyParser.urlencoded({extended:false});  
      
    var app=express();  
    var port = process.env.port||5000;  
      
    //Api code here  
      
    app.listen(port);  
    console.log('Server is started on http://localhost:'+port);  

    //Mysql Connection  
var con = mysql.createConnection({  
    host:'localhost',  
    user:'root',  
    password:'root',  
    database:'pizza'  
}); 
//GET PIZZAS:id   
app.get('/api/orders/:id',function(req,res){  
    var qry = "select json_object(\"orderid\",a.orderid,\"gtotal\",a.gtotal,\"itemlist\",json_arrayagg(a.itemlist)) as res from ( "+
        "SELECT oi.session_id as orderid,sum(pm.price*oi.quantity) as gtotal,"+
        "group_concat(json_object(\"id\",pm.pz_id,\"name\",pm.pz_name,\"quantity\",oi.quantity,\"rate\",pm.price,\"price\",pm.price*oi.quantity)) as itemlist "+
        "FROM pizza.order_item oi join pizza.pizza_master pm on pm.pz_id=oi.pz_id where oi.session_id='"+req.params.id+"' group by oi.session_id )a ";
    con.query(qry,function(err,rows){  
        if(err)  
            throw err;  
        console.log(rows[0]);   
         var dat=rows[0].res.replace(/\\/g, "");
         dat=dat.replace(/\["/g, "[");
         dat=dat.replace(/\"]/g, "]");
         res.send(JSON.parse(dat));   
    });  
});
//GET PIZZA 
app.get('/api/pizzas',function(req,res) {  
    var qry = "select json_arrayagg(result) as data from("+ 
    "select json_object(\"id\",pm.pz_id,\"name\",pm.pz_name,\"price\",pm.price,\"ingredients\",json_arrayagg(im.it_name))  as result from pizza.pz_item_mapping as pim "+
    "join pizza.pizza_master as pm on pm.pz_id=pim.pz_id "+
    "join pizza.item_master as im on im.it_id=pim.it_id "+
    "where pm.status=1 and im.status=1 "+
    "group by pim.pz_id)a";
 con.query(qry,function(err,rows){  
           console.log(rows);
         var obj=rows[0].data.replace(/\\/g, "");
         res.send(JSON.parse(obj)); 
 });
});
 //GET ORDERS 
app.get('/api/orders',function(req,res){  
    var qry = " select json_arrayagg(b.res) as result from ( "+
        "select json_object(\"orderid\",a.orderid,\"gtotal\",a.gtotal,\"itemlist\", json_arrayagg(a.itemlist))  as res from ( "+
        "SELECT oi.session_id as orderid,sum(pm.price*oi.quantity) as gtotal,"+
        "group_concat(json_object(\"id\",pm.pz_id,\"name\",pm.pz_name,\"quantity\",oi.quantity,\"rate\",pm.price,\"price\",pm.price*oi.quantity)) as itemlist "+
        "FROM pizza.order_item oi join pizza.pizza_master pm on pm.pz_id=oi.pz_id  group by oi.session_id )a group by a.orderid )b";
 con.query(qry,function(err,rows){  
    console.log(rows);
    var dat=rows[0].result.replace(/\\/g, "");
    dat=dat.replace(/\["/g, "[");
    dat=dat.replace(/\"]/g, "]");
    res.send(JSON.parse(dat));      
 });     
//POST ORDER ITEMS 
app.post('/api/orderitems',urlencoderParser,function(req,res){  
    var pid=parseInt(req.body.pzid);
    var quan=parseInt(req.body.quantity);
    var cus=req.body.cusid;
    var or=req.body.orderid;
     var qry = "insert into pizza.order_item values(NULL,"+pid+","+quan+",'"+cus+"',now(),'"+or+"')";  
    //var qry ="insert into pizza.order_item values(11,3,3,'cs1004',now(),'or1004')";
    con.query(qry,function(err,rows){  
        if(err)  {
            console.log(err);
            throw err;
        }  
        console.log("1 Row Added.");  
        res.send("1 Row Added.")  
    });  
}); 
});    