From: Andrew Jones <andrew.jones@linux.dev>
Date: Tue,  3 Sep 2024 18:30:47 +0200
Subject: [kvm-unit-tests PATCH 0/3] Support cross compiling with clang
Message-ID: <20240903163046.869262-5-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Modify configure to allow --cc=clang and a cross-prefix to be specified
together (as well as --cflags). This allows compiling with clang, but
using cross binutils for everything else, including the linker. So far
tested on riscv 32- and 64-bit and aarch64 (with some hacks to the code
to get it to compile - which is why there's no gitlab-ci patch for aarch64
in this series). I suspect it should work for other architectures too.

Andrew Jones (3):
  riscv: Drop mstrict-align
  configure: Support cross compiling with clang
  riscv: gitlab-ci: Add clang build tests

 .gitlab-ci.yml | 28 ++++++++++++++++++++++++++++
 configure      | 11 ++++++++---
 riscv/Makefile |  2 +-
 3 files changed, 37 insertions(+), 4 deletions(-)

-- 
2.46.0


