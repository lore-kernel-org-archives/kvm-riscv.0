From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed,  4 Sep 2024 12:50:21 +0200
Subject: [kvm-unit-tests PATCH v2 0/4] Support cross compiling with clang
Message-ID: <20240904105020.1179006-6-andrew.jones@linux.dev>
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

v2:
 - fix building with clang and --config-efi by suppressing a warning
 - added riscv clang efi build to CI
 - picked up Thomas's tags

Andrew Jones (4):
  riscv: Drop mstrict-align
  Makefile: Prepare for clang EFI builds
  configure: Support cross compiling with clang
  riscv: gitlab-ci: Add clang build tests

 .gitlab-ci.yml | 43 +++++++++++++++++++++++++++++++++++++++++++
 Makefile       |  2 ++
 configure      | 11 ++++++++---
 riscv/Makefile |  2 +-
 4 files changed, 54 insertions(+), 4 deletions(-)

-- 
2.46.0


