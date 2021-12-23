From: Vincent Chen <vincent.chen@sifive.com>
Date: Thu, 23 Dec 2021 11:13:42 +0800
Subject: [PATCH] KVM: RISC-V: Avoid spurious virtual interrupts after clearing
 hideleg CSR
Message-ID: <20211223031342.11993-1-vincent.chen@sifive.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When the last VM is terminated, the host kernel will invoke function
hardware_disable_nolock() on each CPU to disable the related virtualization
functions. Here, RISC-V currently only clears hideleg CSR and hedeleg CSR.
This behavior will cause the host kernel to receive spurious interrupts if
hvip CSR has pending interrupts and the corresponding enable bits in vsie
CSR are asserted. To avoid it, hvip CSR and vsie CSR shall be cleared
earlier than hideleg CSR.

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
---
 arch/riscv/kvm/main.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index 421ecf4e6360..31777d29e864 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -58,6 +58,14 @@ int kvm_arch_hardware_enable(void)
 
 void kvm_arch_hardware_disable(void)
 {
+	/*
+	 * After clearing the hideleg CSR, the host kernel will receive spurious
+	 * interrupts if hvip CSR has pending interrupts and the corresponding
+	 * enable bits in vsie CSR are asserted. To avoid it, hvip CSR and
+	 * vsie CSR shall be cleared early than hideleg CSR.
+	 */
+	csr_write(CSR_VSIE, 0);
+	csr_write(CSR_HVIP, 0);
 	csr_write(CSR_HEDELEG, 0);
 	csr_write(CSR_HIDELEG, 0);
 }
-- 
2.17.1


