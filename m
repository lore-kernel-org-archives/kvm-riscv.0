From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 24 Jan 2024 08:18:40 +0100
Subject: [kvm-unit-tests PATCH 24/24] MAINTAINERS: Add riscv
In-Reply-To: <20240124071815.6898-26-andrew.jones@linux.dev>
References: <20240124071815.6898-26-andrew.jones@linux.dev>
Message-ID: <20240124071815.6898-50-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Most of the support for riscv is now in place. Let's make it official
and start adding tests!

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 958735fbfd79..a2fa437da5c9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -94,6 +94,14 @@ F: powerpc/
 F: lib/powerpc/
 F: lib/ppc64/
 
+RISCV
+M: Andrew Jones <andrew.jones@linux.dev>
+S: Supported
+L: kvm-riscv at lists.infradead.org
+F: riscv/
+F: lib/riscv/
+T: https://gitlab.com/jones-drew/kvm-unit-tests.git
+
 S390X
 M: Janosch Frank <frankja@linux.ibm.com>
 M: Claudio Imbrenda <imbrenda@linux.ibm.com>
-- 
2.43.0


