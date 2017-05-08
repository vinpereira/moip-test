# Moip Test

### Introduction

Moip has an application that sends webhooks to the ecommerce of its clients. These webhooks have information about payments (if they were authorized, canceled, etc).

This application generates quite large logs. We need to find out through the log who are the clients who receive the most webhooks and verify all the response status returned by the clients' servers.

### Task

The attached log file contains information about sending webhooks in format:

level=info response_body="" request_to"\<url\>" response_headers= response_status="\<code\>"

Where:

- url: it is the url to which the webhook was sent
- code: it is the status code returned by the client server
- The other information is irrelevant to this task.

You must parse the file and at the end show the following information in the output:

The top 3 urls (most called) with their quantity
A table showing the amount of webhooks by status

e.g.:
- https://woodenoyster.com.br - 100
- https://grotesquemoon.de - 99
- https://notoriouslonesome.com - 90

- 200 - 100
- 201 - 99

ps: the above result is not the real one.

### Result

Create a repository on Github / Bitbucket with your solution and add documentation explaining how to run the program.

This task can be done using the programming language of your choice.

The evaluation will be based on:

- Line of thought (document what you deem important)
- Code design
- Efficiency
- Tests
- Correct answer
