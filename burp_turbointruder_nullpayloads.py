# null payloads turbo intruder
# - concurrentConnections & requestsPerConnection for threading & speed
# - goal is to maximize RPS with retries ~ 0

def queueRequests(target, wordlists):
    engine = RequestEngine(endpoint=target.endpoint,
                           concurrentConnections=50,
                           requestsPerConnection=1000,
                           pipeline=False,
                           engine=engine.HTTP2
                           )

    for word in range(1000000):
        engine.queue(target.req, "")


def handleResponse(req, interesting):
    # currently available attributes are req.status, req.wordcount, req.length and req.response
    if req.status != 404:
        table.add(req)