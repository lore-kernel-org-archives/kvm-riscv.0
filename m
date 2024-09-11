From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 11 Sep 2024 11:14:12 +0200
Subject: [kvm-unit-tests PATCH v3 5/5] README: Add cross and clang recipes
In-Reply-To: <20240911091406.134240-7-andrew.jones@linux.dev>
References: <20240911091406.134240-7-andrew.jones@linux.dev>
Message-ID: <20240911091406.134240-12-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add configure command line examples for cross-compiling, for
compiling with clang, and for cross-compiling with clang.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 README.md | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/README.md b/README.md
index 2d6f7db5605c..be07dc28a094 100644
--- a/README.md
+++ b/README.md
@@ -17,6 +17,28 @@ in this directory.  Test images are created in ./ARCH/\*.flat
 
 NOTE: GCC cross-compiler is required for [build on macOS](README.macOS.md).
 
+## Cross-compiling
+
+A cross compiler may be configured by specifying a cross prefix. For example,
+for arm64
+
+    ./configure --arch=arm64 --cross-prefix=aarch64-linux-gnu-
+    make
+
+## clang
+
+clang may be used as an alternative to gcc.
+
+    ./configure --cc=clang
+    make
+
+clang may also be used with cross binutils when cross-compiling. For example,
+for riscv64
+
+    ./configure --arch=riscv64 --cc=clang --cflags='--target=riscv64' \
+                --cross-prefix=riscv64-linux-gnu-
+    make
+
 ## Standalone tests
 
 The tests can be built as standalone.  To create and use standalone tests do:
-- 
2.46.0


