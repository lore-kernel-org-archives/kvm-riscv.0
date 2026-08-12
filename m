Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B647C5B567
	for <kvm-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 05:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZlcrypKdLHMBDibPGsrEevq4koSunqcpDegjVXQ5Fww=; b=WBuxFnI1RYt1k7
	ZikhiMvYs3XbE5SMZc3xaiHu3N/A4pJtZcFiUUt77YaxLZ8VU3i6ZSRtG5FjrC78r5Hy1SexUMuej
	KR2ykjHC6xPaOOSsAJamNCVYXVX6b3CJLARIWo+avdiTMygU4sr8I5zi/dOarLGUDo+OP37JpRGZG
	yeD3X1AT/wBQbhXknMix42/bamp9M7+eyUKzXs2qvsPHnLSiUaz0j87zygDQ2GzxTBZq2qaCAtwvs
	ba3SaqcRj4FOmIFHXN6VMEVOQ2oEp0cZ1KHM41FRgHJhgyf1GWNJmjTDNTstLGpneR5qV6tvyerx+
	HOV1ZqLjOToe3l6HKuMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu1gv-0000000FRae-0h0p;
	Wed, 12 Aug 2026 05:39:53 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu1gq-0000000FRY7-251L;
	Wed, 12 Aug 2026 05:39:52 +0000
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-05 (Coremail) with SMTP id zQCowADnVD8UB3xqybQxBQ--.41533S3;
	Wed, 12 Aug 2026 13:39:35 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Nutty Liu <nutty.liu@hotmail.com>,
	Guo Ren <guoren@kernel.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] RISC-V: KVM: Validate AIA MMIO address ranges
Date: Wed, 12 Aug 2026 13:39:31 +0800
Message-ID: <38f87205419f328693bc6ab25ae78f021c2dd003.1786512671.git.pengpeng@iscas.ac.cn>
In-Reply-To: <cover.1786512671.git.pengpeng@iscas.ac.cn>
References: <cover.1786512671.git.pengpeng@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: zQCowADnVD8UB3xqybQxBQ--.41533S3
X-Coremail-Antispam: 1UD129KBjvJXoWxGr4rXr1rAw13Aw4Duw45KFg_yoW7JF13pr
	47G393WrWFq3yxWwsYyr1qkwn09w10ka1fGryUua1Fkr1IqryfKF1vga4UXF98JrykuF4a
	yF4rta15uF4Fyw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPC14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7Mx
	kF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4U
	MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67
	AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
	80aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI
	43ZEXa7VUjrHUDUUUUU==
X-Originating-IP: [111.196.241.250]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_223948_907091_D1E904E9 
X-CRM114-Status: GOOD (  15.78  )
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Userspace supplies the APLIC and per-vCPU IMSIC base addresses through
the AIA device API.  The address setters currently reject only
misaligned addresses.

The regions are later registered on KVM's MMIO bus with fixed sizes.  An
aligned base near U64_MAX can therefore wrap when the range end is
formed.  A lower base can still place the range beyond the selected
guest stage-2 physical address space.  kvm_io_bus_cmp() assumes that
registered ranges do not wrap.

Validate the complete interval when an address is stored.  Since
KVM_CAP_VM_GPA_BITS can change the selected GPA width before AIA
initialization, validate every address again before registering the
first MMIO device.

Return -EINVAL for misalignment or arithmetic overflow and -E2BIG when
the end exceeds the stage-2 GPA limit, following the arm64 VGIC
address-validation convention.

Fixes: 89d01306e34d ("RISC-V: KVM: Implement device interface for AIA irqchip")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 arch/riscv/kvm/aia_device.c | 79 +++++++++++++++++++++++++++++++------
 1 file changed, 66 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/kvm/aia_device.c b/arch/riscv/kvm/aia_device.c
index efc7c0bcfba9..e969dbdc4b97 100644
--- a/arch/riscv/kvm/aia_device.c
+++ b/arch/riscv/kvm/aia_device.c
@@ -10,7 +10,9 @@
 #include <linux/bits.h>
 #include <linux/irqchip/riscv-imsic.h>
 #include <linux/kvm_host.h>
+#include <linux/overflow.h>
 #include <linux/uaccess.h>
+#include <asm/kvm_gstage.h>
 #include <asm/kvm_isa.h>
 
 static int aia_create(struct kvm_device *dev, u32 type)
@@ -142,17 +144,37 @@ static int aia_config(struct kvm *kvm, unsigned long type,
 	return 0;
 }
 
+static int aia_check_addr_range(struct kvm *kvm, u64 addr, u64 alignment,
+				u64 size)
+{
+	u64 end;
+
+	if (!IS_ALIGNED(addr, alignment))
+		return -EINVAL;
+
+	if (check_add_overflow(addr, size, &end))
+		return -EINVAL;
+
+	if (end > kvm_riscv_gstage_gpa_size(kvm->arch.pgd_levels))
+		return -E2BIG;
+
+	return 0;
+}
+
 static int aia_aplic_addr(struct kvm *kvm, u64 *addr, bool write)
 {
 	struct kvm_aia *aia = &kvm->arch.aia;
+	int ret;
 
 	if (write) {
 		/* Writes can only be done before irqchip is initialized */
 		if (kvm_riscv_aia_initialized(kvm))
 			return -EBUSY;
 
-		if (*addr & (KVM_DEV_RISCV_APLIC_ALIGN - 1))
-			return -EINVAL;
+		ret = aia_check_addr_range(kvm, *addr, KVM_DEV_RISCV_APLIC_ALIGN,
+					   KVM_DEV_RISCV_APLIC_SIZE);
+		if (ret)
+			return ret;
 
 		aia->aplic_addr = *addr;
 	} else
@@ -166,6 +188,7 @@ static int aia_imsic_addr(struct kvm *kvm, u64 *addr,
 {
 	struct kvm_vcpu *vcpu;
 	struct kvm_vcpu_aia *vcpu_aia;
+	int ret;
 
 	vcpu = kvm_get_vcpu(kvm, vcpu_idx);
 	if (!vcpu)
@@ -177,8 +200,10 @@ static int aia_imsic_addr(struct kvm *kvm, u64 *addr,
 		if (kvm_riscv_aia_initialized(kvm))
 			return -EBUSY;
 
-		if (*addr & (KVM_DEV_RISCV_IMSIC_ALIGN - 1))
-			return -EINVAL;
+		ret = aia_check_addr_range(kvm, *addr, KVM_DEV_RISCV_IMSIC_ALIGN,
+					   KVM_DEV_RISCV_IMSIC_SIZE);
+		if (ret)
+			return ret;
 	}
 
 	mutex_lock(&vcpu->mutex);
@@ -191,6 +216,40 @@ static int aia_imsic_addr(struct kvm *kvm, u64 *addr,
 	return 0;
 }
 
+static int aia_validate_addr_ranges(struct kvm *kvm)
+{
+	struct kvm_aia *aia = &kvm->arch.aia;
+	struct kvm_vcpu_aia *vaia;
+	struct kvm_vcpu *vcpu;
+	unsigned long idx;
+	int ret;
+
+	if (aia->nr_sources) {
+		if (aia->aplic_addr == KVM_RISCV_AIA_UNDEF_ADDR)
+			return -EINVAL;
+
+		ret = aia_check_addr_range(kvm, aia->aplic_addr,
+					   KVM_DEV_RISCV_APLIC_ALIGN,
+					   KVM_DEV_RISCV_APLIC_SIZE);
+		if (ret)
+			return ret;
+	}
+
+	kvm_for_each_vcpu(idx, vcpu, kvm) {
+		vaia = &vcpu->arch.aia_context;
+		if (vaia->imsic_addr == KVM_RISCV_AIA_UNDEF_ADDR)
+			return -EINVAL;
+
+		ret = aia_check_addr_range(kvm, vaia->imsic_addr,
+					   KVM_DEV_RISCV_IMSIC_ALIGN,
+					   KVM_DEV_RISCV_IMSIC_SIZE);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static gpa_t aia_imsic_ppn(struct kvm_aia *aia, gpa_t addr)
 {
 	u32 h, l;
@@ -244,9 +303,9 @@ static int aia_init(struct kvm *kvm)
 	if (aia->nr_ids < aia->nr_sources)
 		return -EINVAL;
 
-	/* APLIC base is required for non-zero number of sources */
-	if (aia->nr_sources && aia->aplic_addr == KVM_RISCV_AIA_UNDEF_ADDR)
-		return -EINVAL;
+	ret = aia_validate_addr_ranges(kvm);
+	if (ret)
+		return ret;
 
 	/* Group index bits must not overlap guest and HART index bits. */
 	if (aia->nr_group_bits &&
@@ -263,12 +322,6 @@ static int aia_init(struct kvm *kvm)
 	kvm_for_each_vcpu(idx, vcpu, kvm) {
 		vaia = &vcpu->arch.aia_context;
 
-		/* IMSIC base is required */
-		if (vaia->imsic_addr == KVM_RISCV_AIA_UNDEF_ADDR) {
-			ret = -EINVAL;
-			goto fail_cleanup_imsics;
-		}
-
 		/* All IMSICs should have matching base PPN */
 		if (base_ppn == KVM_RISCV_AIA_UNDEF_ADDR)
 			base_ppn = aia_imsic_ppn(aia, vaia->imsic_addr);
-- 
2.50.1 (Apple Git-155)


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
