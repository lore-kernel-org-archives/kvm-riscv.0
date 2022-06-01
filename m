From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed,  1 Jun 2022 10:51:22 +0200
Subject: [PATCH] MAINTAINERS: Limit KVM RISC-V entry to existing selftests
Message-ID: <20220601085122.28176-1-lukas.bulwahn@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Commit fed9b26b2501 ("MAINTAINERS: Update KVM RISC-V entry to cover
selftests support") optimistically adds a file entry for
tools/testing/selftests/kvm/riscv/, but this directory does not exist.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
broken reference. The script is very useful to keep MAINTAINERS up to date
and MAINTAINERS can be kept in a state where the script emits no warning.

So, just drop the non-matching file entry rather than starting to collect
exceptions of entries that may match in some close or distant future.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Anup, please consider to pick this minor clean-up patch.

 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 36eab5ae237d..a8eee9d2aea5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10863,7 +10863,6 @@ F:	arch/riscv/include/asm/kvm*
 F:	arch/riscv/include/uapi/asm/kvm*
 F:	arch/riscv/kvm/
 F:	tools/testing/selftests/kvm/*/riscv/
-F:	tools/testing/selftests/kvm/riscv/
 
 KERNEL VIRTUAL MACHINE for s390 (KVM/s390)
 M:	Christian Borntraeger <borntraeger@linux.ibm.com>
-- 
2.17.1


