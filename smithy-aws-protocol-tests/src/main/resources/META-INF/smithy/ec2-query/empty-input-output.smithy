// This file defines test cases that test the basics of empty input and
// output shape serialization.

$version: "0.5.0"

namespace aws.protocols.tests.ec2

use smithy.test#httpRequestTests
use smithy.test#httpResponseTests

/// The example tests how requests and responses are serialized when there's
/// no request payload or response members.
///
/// While this should be rare, code generators must support this.
operation NoInputAndOutput {
    output: NoInputAndOutputOutput
}

apply NoInputAndOutput @httpRequestTests([
    {
        id: "Ec2QueryNoInputAndOutput",
        description: "No input serializes no payload",
        protocol: "aws.ec2",
        method: "POST",
        uri: "/",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: """
              Action=NoInputAndOutput
              &Version=2020-01-08""",
        bodyMediaType: "application/x-www-form-urlencoded"
    }
])

apply NoInputAndOutput @httpResponseTests([
    {
        id: "Ec2QueryNoInputAndOutput",
        description: "Empty output",
        protocol: "aws.ec2",
        code: 200,
        headers: {
            "Content-Type": "text/xml;charset=UTF-8"
        },
        body: """
              <NoInputAndOutputResponse xmlns="https://example.com/">
                  <RequestId>requestid</RequestId>
              </NoInputAndOutputResponse>
              """,
        bodyMediaType: "application/xml",
    }
])

structure NoInputAndOutputOutput {}

/// The example tests how requests and responses are serialized when there's
/// no request or response members.
///
/// While this should be rare, code generators must support this.
operation EmptyInputAndEmptyOutput {
    input: EmptyInputAndEmptyOutputInput,
    output: EmptyInputAndEmptyOutputOutput
}

apply EmptyInputAndEmptyOutput @httpRequestTests([
    {
        id: "Ec2QueryEmptyInputAndEmptyOutput",
        description: "Empty input serializes no extra query params",
        protocol: "aws.ec2",
        method: "POST",
        uri: "/",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: """
              Action=EmptyInputAndEmptyOutput
              &Version=2020-01-08""",
        bodyMediaType: "application/x-www-form-urlencoded"
    },
])

apply EmptyInputAndEmptyOutput @httpResponseTests([
    {
        id: "Ec2QueryEmptyInputAndEmptyOutput",
        description: "Empty output",
        protocol: "aws.ec2",
        code: 200,
        headers: {
            "Content-Type": "text/xml;charset=UTF-8"
        },
        body: """
              <EmptyInputAndEmptyOutputResponse xmlns="https://example.com/">
                  <RequestId>requestid</RequestId>
              </EmptyInputAndEmptyOutputResponse>
              """,
        bodyMediaType: "application/xml",
    },
])

structure EmptyInputAndEmptyOutputInput {}
structure EmptyInputAndEmptyOutputOutput {}