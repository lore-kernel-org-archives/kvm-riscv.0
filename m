From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 22 Mar 2023 20:28:58 +0100
Subject: [PATCH 2/2] RISC-V: KVM: Require alternatives
In-Reply-To: <20230322192858.1189272-1-ajones@ventanamicro.com>
References: <20230322192858.1189272-1-ajones@ventanamicro.com>
Message-ID: <20230322192858.1189272-3-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

KVM makes use of riscv_has_extension_unlikely() to check for the
svinval extension. riscv_has_extension_unlikely() is built on
alternatives, which means KVM should ensure alternatives support
is available. Select RISCV_ALTERNATIVE from KVM.

Fixes: e8ad17d2b5f3 ("riscv: KVM: Switch has_svinval() to riscv_has_extension_unlikely()")
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index 5bcb2d519b95..9dd61db0acc5 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -28,6 +28,7 @@ config KVM
 	select KVM_XFER_TO_GUEST_WORK
 	select MMU_NOTIFIER
 	select PREEMPT_NOTIFIERS
+	select RISCV_ALTERNATIVE
 	select SRCU
 	help
 	  Support hosting virtualized guest machines.
-- 
2.39.2


