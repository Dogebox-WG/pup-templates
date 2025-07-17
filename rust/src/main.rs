use tiny_http::{Server, Response, Header};

fn main() {
    let server = Server::http("0.0.0.0:8080").unwrap();

    for request in server.incoming_requests() {
        let response = Response::from_string("<div style='text-align: center; font-size: 2em; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);'>This is my Rust Pup</div>")
            .with_header("Content-Type: text/html".parse::<Header>().unwrap());
        request.respond(response).unwrap();
    }
}
