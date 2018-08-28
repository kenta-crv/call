# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## takigawa
1. Create a configuration file for your application:

    ```bash
    cp .env.example .env
    ```

2. Edit `.env` 変数名の意味がわからなければご連絡ください

3. Next, we need to install our depenedencies:

    ```bash
    bundle install
    ```

4. Run

    ```bash
    bundle exec rails s
    ```

5. Your application should now be running at [http://localhost:3000](http://localhost:3000).

6. [Download and install ngrok](https://ngrok.com/download)

7. Run ngrok:

    ```bash
    ngrok http 3000
    ```

8. When ngrok starts up, it will assign a unique URL to your tunnel.
It might be something like `https://asdf456.ngrok.io`. Take note of this.
もしかしたらスクリーンショットは:4567となっているかもしれませんが、:3000で大丈夫です。


9. [Configure your TwiML app](https://www.twilio.com//console/phone-numbers/dev-tools/twiml-apps)'s
Voice "REQUEST URL" to be your ngrok URL plus `/call/voice`. For example:
もしかしたらスクリーンショットは/voiceとなっているかもしれませんが、/call/voiceで大丈夫です。


    ![screenshot of twiml app](https://s3.amazonaws.com/com.twilio.prod.twilio-docs/images/TwilioClientRequestUrl.original.png)

10. これで電話がかかります。しかし、1.もしトライアルなら、もしかしたら登録してある電話番号にしかかからないかもしれないこと、2. 国際標準なので090~の電話番号は+8190~として欲しいです
