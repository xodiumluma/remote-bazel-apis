"""This is deprecated; only for backwards compatibility"""

load("//Lremote_apis_deps.bzl", "remote_apis_go_deps")

def switched_rules_by_language(
        name,
        java = False,
        go = False,
        cc = False,
        rules_override = {}):
    """Deprecated; only for backwards compatibility"""
    print(
        "We deprecated the switched_rules_by_language macro. Consumers of" +
        " @bazel_remote_apis should, in their specific workspace, specify" +
        " per-language dependencies.",
    )
    if go:
        remote_apis_go_deps()