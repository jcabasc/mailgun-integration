module MailgunResponseFixtureSupport
  def bounces_response
    "{\"items\":[{\"address\":\"bounce@mailguntest.com\",\"code\":\"550\",\"error\":\"bounce\",\"created_at\":\"Sat, 11 Jun 2016 20:49:27 UTC\"}],\"paging\":{\"first\":\"https://api.mailgun.net/v3/sandbox5b33d3b7058543a29bac9432fcdb9756.mailgun.org/bounces?limit=100\",\"last\":\"https://api.mailgun.net/v3/sandbox5b33d3b7058543a29bac9432fcdb9756.mailgun.org/bounces?page=last\\u0026limit=100\",\"next\":\"https://api.mailgun.net/v3/sandbox5b33d3b7058543a29bac9432fcdb9756.mailgun.org/bounces?page=next\\u0026address=jcabas.ing%40gmail.com\\u0026limit=100\",\"previous\":\"https://api.mailgun.net/v3/sandbox5b33d3b7058543a29bac9432fcdb9756.mailgun.org/bounces?page=previous\\u0026address=jcabas.ing%40gmail.com\\u0026limit=100\"}}"
  end

  def unsubscribes_response
    "{\"items\":[{\"address\":\"unsubscribe@mailguntest.com\",\"tags\":[\"remove\"],\"created_at\":\"Sat, 11 Jun 2016 20:50:21 UTC\"}],\"paging\":{\"first\":\"https://api.mailgun.net/v3/sandbox5b33d3b7058543a29bac9432fcdb9756.mailgun.org/unsubscribes?limit=100\",\"last\":\"https://api.mailgun.net/v3/sandbox5b33d3b7058543a29bac9432fcdb9756.mailgun.org/unsubscribes?page=last\\u0026limit=100\",\"next\":\"https://api.mailgun.net/v3/sandbox5b33d3b7058543a29bac9432fcdb9756.mailgun.org/unsubscribes?page=next\\u0026address=jonathan.cabas%40koombea.com\\u0026limit=100\",\"previous\":\"https://api.mailgun.net/v3/sandbox5b33d3b7058543a29bac9432fcdb9756.mailgun.org/unsubscribes?page=previous\\u0026address=jonathan.cabas%40koombea.com\\u0026limit=100\"}}"
  end

  def complaints_response
   "{\"items\":[{\"address\":\"complaint@mailguntest.com\",\"created_at\":\"Sat, 11 Jun 2016 20:49:47 UTC\"},{\"address\":\"bounce@mailguntest.com\",\"created_at\":\"Sat, 11 Jun 2016 20:51:07 UTC\"}],\"paging\":{\"first\":\"https://api.mailgun.net/v3/sandbox5b33d3b7058543a29bac9432fcdb9756.mailgun.org/complaints?limit=100\",\"last\":\"https://api.mailgun.net/v3/sandbox5b33d3b7058543a29bac9432fcdb9756.mailgun.org/complaints?page=last\\u0026limit=100\",\"next\":\"https://api.mailgun.net/v3/sandbox5b33d3b7058543a29bac9432fcdb9756.mailgun.org/complaints?page=next\\u0026address=jcabas.ing%40gmail.com\\u0026limit=100\",\"previous\":\"https://api.mailgun.net/v3/sandbox5b33d3b7058543a29bac9432fcdb9756.mailgun.org/complaints?page=previous\\u0026address=gisellaestarita3%40gmail.com\\u0026limit=100\"}}"
  end

  def sent_message
    "{\n  \"id\": \"<20160612173824.11415.51202.B8F3524F@sandbox5b33d3b7058543a29bac9432fcdb9756.mailgun.org>\",\n  \"message\": \"Queued. Thank you.\"\n}"
  end
end
