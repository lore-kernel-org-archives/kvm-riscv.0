From: Andrew Jones <andrew.jones@linux.dev>
Date: Thu,  8 Aug 2024 15:02:33 +0200
Subject: [kvm-unit-tests PATCH 3/3] riscv: Extend gitlab CI
In-Reply-To: <20240808130229.47415-5-andrew.jones@linux.dev>
References: <20240808130229.47415-5-andrew.jones@linux.dev>
Message-ID: <20240808130229.47415-8-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fedora's riscv64 gcc supports ilp32 so enable 32-bit RISCV testing.
And use the out-of-tree template for the 32-bit build to get that
covered too. Also add EFI build testing and, since Fedora has been
updated which brings in a later QEMU, we can now use the 'max' cpu
type.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 .gitlab-ci.yml | 34 +++++++++++++++++++++++++++++-----
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index e0eb85a94910..ffbed7c8d301 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -133,18 +133,42 @@ build-ppc64le:
       | tee results.txt
  - if grep -q FAIL results.txt ; then exit 1 ; fi
 
-# build-riscv32:
-# Fedora doesn't package a riscv32 compiler for QEMU. Oh, well.
+build-riscv32:
+ extends: .outoftree_template
+ script:
+ - dnf install -y qemu-system-riscv gcc-riscv64-linux-gnu
+ - ./configure --arch=riscv32 --cross-prefix=riscv64-linux-gnu-
+ - make -j2
+ - printf "FOO=foo\nBAR=bar\nBAZ=baz\nMVENDORID=0\nMARCHID=0\nMIMPID=0\n" >test-env
+ - ACCEL=tcg KVM_UNIT_TESTS_ENV=test-env ./run_tests.sh
+      selftest
+      sbi
+      | tee results.txt
+ - grep -q PASS results.txt && ! grep -q FAIL results.txt
 
-# Select 'rv64' with PROCESSOR_OVERRIDE in case QEMU is too old to have 'max'
 build-riscv64:
  extends: .intree_template
  script:
  - dnf install -y qemu-system-riscv gcc-riscv64-linux-gnu
  - ./configure --arch=riscv64 --cross-prefix=riscv64-linux-gnu-
  - make -j2
- - printf "FOO=foo\nBAR=bar\nBAZ=baz\nMVENDORID=0\n" >test-env
- - PROCESSOR_OVERRIDE=rv64 ACCEL=tcg KVM_UNIT_TESTS_ENV=test-env ./run_tests.sh
+ - printf "FOO=foo\nBAR=bar\nBAZ=baz\nMVENDORID=0\nMARCHID=0\nMIMPID=0\n" >test-env
+ - ACCEL=tcg KVM_UNIT_TESTS_ENV=test-env ./run_tests.sh
+      selftest
+      sbi
+      | tee results.txt
+ - grep -q PASS results.txt && ! grep -q FAIL results.txt
+
+build-riscv64-efi:
+ extends: .intree_template
+ script:
+ - dnf install -y edk2-riscv64 qemu-system-riscv gcc-riscv64-linux-gnu
+ - cp /usr/share/edk2/riscv/RISCV_VIRT_CODE.fd .
+ - truncate -s 32M RISCV_VIRT_CODE.fd
+ - ./configure --arch=riscv64 --cross-prefix=riscv64-linux-gnu- --enable-efi
+ - make -j2
+ - printf "FOO=foo\nBAR=bar\nBAZ=baz\nMVENDORID=0\nMARCHID=0\nMIMPID=0\n" >test-env
+ - ACCEL=tcg KVM_UNIT_TESTS_ENV=test-env ./run_tests.sh
       selftest
       sbi
       | tee results.txt
-- 
2.45.2


