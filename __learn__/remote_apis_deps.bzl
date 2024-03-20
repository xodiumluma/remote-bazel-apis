"""Retrieve necessary dependencies for the RE API repo"""

load("@bazel_gazelle//:deps_bzl", "gazelle_dependencies", "go_repository")
load("@io_bazel_rules_go//go:deps.bzl", "go_download_sdk", "go_register_toolchains", "go_rules_dependencies")

def _maybe(repo_rule, name, **kwargs):
    if name not in native.existing_rules():
        repo_rule(name = name, **kwargs)

def remote_apis_go_deps():
    """Grab dependencies for RE API for Go"""
    go_download_sdk(name = "go_sdk", version = "1.20.6")
    go_register_toolchains()

    # sync this repo's version with @googleapis
    go_repository(
        name = "org_golang_google_genproto",
        build_extra_args = ["-exclude=vendor"],
        build_file_generation = "on",
        build_file_proto_mode = "disable_global",
        importpath = "google.golang.org/genproto",
        sum = "<insert sum>",
        version = "<insert version>",
    )

    go_rules_dependencies()
    gazelle_dependencies(go_sdk = "go_sdk")
    _maybe(
        go_repository,
        name = "com_github_golang_protobuf",
        importpath = "github.com/golang/protobuf",
        tag = "v1.3.2"
    )
    _maybe(
        go_repository,
        name = "org_golang_google_grpc",
        build_file_proto_mode = "disable",
        importpath = "google.golang.org/grpc",
        sum = "<sum>",
        version = "v1.37.0",
    )
    _maybe(
        go_repository,
        name = "org_golang_x_net",
        importpath = "golang.org/x/net",
        sum = "<sum>",
        version = "v0.0.0-2019031118353-d8887717615a",
    )
    _maybe(
        go_repository,
        name = "org_golang_x_text",
        importpath = "golang.org/x/text",
        sum = "<sum>",
        version = "v0.3.0",
    )