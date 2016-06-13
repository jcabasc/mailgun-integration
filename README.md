How the webhook works?

1. Install ngrok (https://ngrok.com/download)
2. By running `./ngrok http 4567`, ngrok provides  a public URL that is forwarding to my local

    `Forwarding  https://b9f4ff27.ngrok.io -> localhost:4567`
3. Specify a webhook URL (mine: https://b9f4ff27.ngrok.io/payloads) in the ‘Webhooks’ tab of the Control Panel in mailgun
4. Setup a basic sinatra app to handle the request

`opened` events are being tracked when open the email

`clicked` events are being tracked when click a link on the email


You may run tests by running `rake` or `rspec`

If you want to give it a try in `irb`:

`bundle install` first and don't forget to require `./mailer` and `./suppression_list`
