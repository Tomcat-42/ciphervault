FROM cppdev:latest AS builder

USER cppdev
WORKDIR /home/cppdev/ciphervault

COPY --chmod=0755 --chown=cppdev:cppdev . ./

# build deps
RUN xrepo install -y fmt cxxopts gtest benchmark tabulate
RUN xmake build -y

# test
# RUN xmake run test

# benchmark
# RUN xmake run bench

# ciphervault
# RUN xmake run ciphervault

# FROM cppdev:latest

# FROM cppdev:latest AS runner
#
# COPY --chown=cppdev:cppdev --from=builder \
#     /home/cppdev/ciphervault/build/linux/x86_64/release/ciphervault \
#     ./app/
#
# ENTRYPOINT [ "./app/ciphervault" ]
