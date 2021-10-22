From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 22 Oct 2021 08:15:14 +0200
Subject: [PATCH] riscv: do not select non-existing config ANON_INODES
Message-ID: <20211022061514.25946-1-lukas.bulwahn@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Commit 99cdc6c18c2d ("RISC-V: Add initial skeletal KVM support") selects
the config ANON_INODES in config KVM, but the config ANON_INODES is removed
since commit 5dd50aaeb185 ("Make anon_inodes unconditional") in 2018.

Hence, ./scripts/checkkconfigsymbols.py warns on non-existing symbols:

  ANON_INODES
  Referencing files: arch/riscv/kvm/Kconfig

Remove selecting the non-existing config ANON_INODES.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 arch/riscv/kvm/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index a712bb910cda..f5a342fa1b1d 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -22,7 +22,6 @@ config KVM
 	depends on RISCV_SBI && MMU
 	select MMU_NOTIFIER
 	select PREEMPT_NOTIFIERS
-	select ANON_INODES
 	select KVM_MMIO
 	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
 	select HAVE_KVM_VCPU_ASYNC_IOCTL
-- 
2.26.2


