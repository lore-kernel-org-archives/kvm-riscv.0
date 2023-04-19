From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:23:45 -0700
Subject: [RFC kvmtool 05/10] riscv: Do not create APLIC for TVMs
In-Reply-To: <20230419222350.3604274-1-atishp@rivosinc.com>
References: <20230419222350.3604274-1-atishp@rivosinc.com>
Message-ID: <20230419222350.3604274-6-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The CoVE VMs do not support wired interrupts. Thus no need of APLIC at
this point.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 riscv/aia.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/riscv/aia.c b/riscv/aia.c
index 8c85b3f..a3b8618 100644
--- a/riscv/aia.c
+++ b/riscv/aia.c
@@ -143,6 +143,11 @@ static int aia__init(struct kvm *kvm)
 		.attr	= KVM_DEV_RISCV_AIA_CTRL_INIT,
 	};
 
+
+	/* CoVE VM only supports hardware with physical guest interrupt file */
+	if (kvm->cfg.arch.cove_vm)
+		aia_mode = KVM_DEV_RISCV_AIA_MODE_HWACCEL;
+
 	/* Setup global device attribute variables */
 	aia_mode_attr.addr = (u64)(unsigned long)&aia_mode;
 	aia_nr_ids_attr.addr = (u64)(unsigned long)&aia_nr_ids;
@@ -160,10 +165,7 @@ static int aia__init(struct kvm *kvm)
 	ret = ioctl(aia_fd, KVM_GET_DEVICE_ATTR, &aia_nr_ids_attr);
 	if (ret)
 		return ret;
-	aia_nr_sources = irq__get_nr_allocated_lines();
-	ret = ioctl(aia_fd, KVM_SET_DEVICE_ATTR, &aia_nr_sources_attr);
-	if (ret)
-		return ret;
+
 	aia_hart_bits = fls_long(kvm->nrcpus);
 	ret = ioctl(aia_fd, KVM_SET_DEVICE_ATTR, &aia_hart_bits_attr);
 	if (ret)
@@ -172,12 +174,21 @@ static int aia__init(struct kvm *kvm)
 	/* Save number of HARTs for FDT generation */
 	aia_nr_harts = kvm->nrcpus;
 
-	/* Set AIA device addresses */
-	aia_addr = AIA_APLIC_ADDR(aia_nr_harts);
-	aia_addr_attr.attr = KVM_DEV_RISCV_AIA_ADDR_APLIC;
-	ret = ioctl(aia_fd, KVM_SET_DEVICE_ATTR, &aia_addr_attr);
-	if (ret)
-		return ret;
+	/* CoVE VMs do not support APLIC yet */
+	if (!kvm->cfg.arch.cove_vm) {
+		aia_nr_sources = irq__get_nr_allocated_lines();
+		ret = ioctl(aia_fd, KVM_SET_DEVICE_ATTR, &aia_nr_sources_attr);
+		if (ret)
+			return ret;
+
+		/* Set AIA device addresses */
+		aia_addr = AIA_APLIC_ADDR(aia_nr_harts);
+		aia_addr_attr.attr = KVM_DEV_RISCV_AIA_ADDR_APLIC;
+		ret = ioctl(aia_fd, KVM_SET_DEVICE_ATTR, &aia_addr_attr);
+		if (ret)
+			return ret;
+	}
+
 	for (i = 0; i < kvm->nrcpus; i++) {
 		aia_addr = AIA_IMSIC_ADDR(i);
 		aia_addr_attr.attr = KVM_DEV_RISCV_AIA_ADDR_IMSIC(i);
-- 
2.25.1


