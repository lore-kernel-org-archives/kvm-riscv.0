From: Andy Chiu <andy.chiu@sifive.com>
Date: Thu, 18 May 2023 16:19:49 +0000
Subject: [PATCH -next v20 26/26] selftests: add .gitignore file for RISC-V hwprobe
In-Reply-To: <20230518161949.11203-1-andy.chiu@sifive.com>
References: <20230518161949.11203-1-andy.chiu@sifive.com>
Message-ID: <20230518161949.11203-27-andy.chiu@sifive.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The executable file "hwprobe" should be ignored by git, adding it to fix
that.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 tools/testing/selftests/riscv/hwprobe/.gitignore | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 tools/testing/selftests/riscv/hwprobe/.gitignore

diff --git a/tools/testing/selftests/riscv/hwprobe/.gitignore b/tools/testing/selftests/riscv/hwprobe/.gitignore
new file mode 100644
index 000000000000..8113dc3bdd03
--- /dev/null
+++ b/tools/testing/selftests/riscv/hwprobe/.gitignore
@@ -0,0 +1 @@
+hwprobe
-- 
2.17.1


