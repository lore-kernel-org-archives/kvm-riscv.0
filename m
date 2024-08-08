From: Andrew Jones <andrew.jones@linux.dev>
Date: Thu,  8 Aug 2024 15:02:30 +0200
Subject: [kvm-unit-tests PATCH 0/3] riscv: Extend CI
Message-ID: <20240808130229.47415-5-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

So far we were only building and testing 64-bit, non-efi in the CI for
riscv. I had mistakenly thought Fedora's riscv compiler could only build
64-bit, but it's multilib so we just need to add some CFLAGS to get it
to work. To preserve building with a 32-bit-only riscv compiler we need
to introduce limits.h to our tiny libc. And, while adding 32-bit builds
to CI we also add EFI builds so now we test 32-bit, 64-bit, and 64-bit
EFI. And, since Fedora has been udpated, bringing in a later QEMU, we
can now do the testing with the 'max' cpu type.

Andrew Jones (3):
  lib: Add limits.h
  riscv: Build with explicit ABI
  riscv: Extend gitlab CI

 .gitlab-ci.yml | 34 +++++++++++++++++++++++++++++-----
 lib/limits.h   | 43 +++++++++++++++++++++++++++++++++++++++++++
 riscv/Makefile | 10 ++++++----
 3 files changed, 78 insertions(+), 9 deletions(-)
 create mode 100644 lib/limits.h

-- 
2.45.2


