Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7C5FCE086
	for <kvm-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 14:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pkn0PQ01vgYI4dK0BA0/UdbgFsG30MmcRtLVnX2XzUk=; b=UKat5IFqiQC+Gf
	jvHGPxxBkSSF7TGRZPE6x4wPZSjHqRjY0MLoBm6rECvw88zILH4YXlbJwzC4OpMJgDsSm43pviOop
	Qdyc49gbhqqM0DkVdzLuFsYNMeKcFbVajlO1RkDEMpH9Mw7F+phUDPuBKWd3GYg+R0gS05y4mc3nD
	GwuOC+josiM2mF8CFZqxkJDkZp0AqI66ypnO2qG76msxA/FCNjjlzqlmabSqZmrbrJ/NnmXgPgCnk
	NFSqqL+OAgVve+yk6f40IxkMIiUoRUn8/IDReMh5bTm5AudXx9GbiyHiOtsYlqH5/dt2qY/QoO0E7
	NoTjubfCyg5QRPVK/BWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcDP-00000006Jf2-3Kxl;
	Thu, 26 Feb 2026 14:19:43 +0000
Received: from mx-2023-1.gwdg.de ([134.76.10.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcDN-00000006JSR-0Xbo;
	Thu, 26 Feb 2026 14:19:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cispa.de;
	s=2023-rsa; h=CC:To:In-Reply-To:References:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZFcl30SuXm+JwQ5EbT5XB2vzMzMRZ5Ig39tXZ+wAMMU=; b=Tg5qcR4Q3rz50AyY0MXi6UFXA2
	95a3R//Uyh6GL/HtfEy57b5I9SYP09nQTFnCvHXS4XD9y9XMaGArAsj8pkZ8rug4tq/foH/UexPj7
	FNQK3GnWkECgm+YLBDjW8dKZih203aRH/Rs0H0CiubkBTsRp9i0p92pQ/XCuUhJiD8DOkDN7mc6oX
	Tb+V7G+xPdBy3we8GQgG5UFpE7ZwGdv9e7RTXHpGLm/r4+Lg5xma0eq+3ZYrG0deauO3VdysDEfGW
	zibiiAbTqpcHYyeoAcj+gytnA7MD1AgcnUFybDPm5Dws3TsFANQLRKi0eFX7OebNzkvLxmPnCAPhy
	wrvwN2eA==;
Received: from mailer.gwdg.de ([134.76.10.26]:36710)
	by mailer.gwdg.de with esmtp (GWDG Mailer)
	(envelope-from <lukas.gerlach@cispa.de>)
	id 1vvcD6-006EFr-08;
	Thu, 26 Feb 2026 15:19:29 +0100
Received: from mbx19-sub-05.um.gwdg.de ([10.108.142.70] helo=email.gwdg.de)
	by mailer.gwdg.de with esmtps (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(GWDG Mailer)
	(envelope-from <lukas.gerlach@cispa.de>)
	id 1vvcD6-0009ur-1r;
	Thu, 26 Feb 2026 15:19:24 +0100
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (10.250.9.200) by MBX19-SUB-05.um.gwdg.de (10.108.142.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Thu, 26 Feb 2026 15:19:23 +0100
From: Lukas Gerlach <lukas.gerlach@cispa.de>
Date: Thu, 26 Feb 2026 15:18:58 +0100
Subject: [PATCH 1/4] KVM: riscv: Fix Spectre-v1 in ONE_REG register access
MIME-Version: 1.0
Message-ID: <20260226-kvm-riscv-spectre-v1-v1-1-5f930ea16691@cispa.de>
References: <20260226-kvm-riscv-spectre-v1-v1-0-5f930ea16691@cispa.de>
In-Reply-To: <20260226-kvm-riscv-spectre-v1-v1-0-5f930ea16691@cispa.de>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert
 Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones
	<ajones@ventanamicro.com>
CC: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Daniel
 Weber <daniel.weber@cispa.de>, Michael Schwarz <michael.schwarz@cispa.de>,
	Marton Bognar <marton.bognar@kuleuven.be>, Jo Van Bulck
	<jo.vanbulck@kuleuven.be>, Lukas Gerlach <lukas.gerlach@cispa.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4768;
 i=lukas.gerlach@cispa.de; h=from:subject:message-id;
 bh=pjzrvKEuoSjY816OWcjYa5SX1DBMtRpisKeOqvc4J74=;
 b=owGbwMvMwCGWoTIjqP/42kTG02pJDJkLwuK9un98mr7lp8Cs9AbmJ7zn3Ir/bZCK/9uoJ+18I
 qT8H8/PjlIWBjEOBlkxRZapgq8Z+/Y48CRlHj4HM4eVCWQIAxenAEykRp3hf2XH8l1vN/t/yUxb
 MNfgcIjij8XvQ26xaH0XDOjuMNxva8fIsHGihnWni7bCBZnSneGuq/m/CN5qS56zfpXfBOEbPp0
 dPAA=
X-Developer-Key: i=lukas.gerlach@cispa.de; a=openpgp;
 fpr=9511EB018EBC400C6269C3CE682498528FC7AD61
X-Originating-IP: [10.250.9.200]
X-ClientProxiedBy: mbx19-sub-02.um.gwdg.de (10.108.142.55) To
 MBX19-SUB-05.um.gwdg.de (10.108.142.70)
X-Virus-Scanned: (clean) by clamav
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_061941_183365_3C6F102D 
X-CRM114-Status: GOOD (  10.81  )
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

User-controlled register indices from the ONE_REG ioctl are used to
index into arrays of register values. Sanitize them with
array_index_nospec() to prevent speculative out-of-bounds access.

Signed-off-by: Lukas Gerlach <lukas.gerlach@cispa.de>
---
 arch/riscv/kvm/vcpu_onereg.c | 36 ++++++++++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index e7ab6cb00646..a4c8703a96a9 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -10,6 +10,7 @@
 #include <linux/bitops.h>
 #include <linux/errno.h>
 #include <linux/err.h>
+#include <linux/nospec.h>
 #include <linux/uaccess.h>
 #include <linux/kvm_host.h>
 #include <asm/cacheflush.h>
@@ -127,6 +128,7 @@ static int kvm_riscv_vcpu_isa_check_host(unsigned long kvm_ext, unsigned long *g
 	    kvm_ext >= ARRAY_SIZE(kvm_isa_ext_arr))
 		return -ENOENT;
 
+	kvm_ext = array_index_nospec(kvm_ext, ARRAY_SIZE(kvm_isa_ext_arr));
 	*guest_ext = kvm_isa_ext_arr[kvm_ext];
 	switch (*guest_ext) {
 	case RISCV_ISA_EXT_SMNPM:
@@ -443,13 +445,16 @@ static int kvm_riscv_vcpu_get_reg_core(struct kvm_vcpu *vcpu,
 	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
 					    KVM_REG_SIZE_MASK |
 					    KVM_REG_RISCV_CORE);
+	unsigned long regs_max = sizeof(struct kvm_riscv_core) / sizeof(unsigned long);
 	unsigned long reg_val;
 
 	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
 		return -EINVAL;
-	if (reg_num >= sizeof(struct kvm_riscv_core) / sizeof(unsigned long))
+	if (reg_num >= regs_max)
 		return -ENOENT;
 
+	reg_num = array_index_nospec(reg_num, regs_max);
+
 	if (reg_num == KVM_REG_RISCV_CORE_REG(regs.pc))
 		reg_val = cntx->sepc;
 	else if (KVM_REG_RISCV_CORE_REG(regs.pc) < reg_num &&
@@ -476,13 +481,16 @@ static int kvm_riscv_vcpu_set_reg_core(struct kvm_vcpu *vcpu,
 	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
 					    KVM_REG_SIZE_MASK |
 					    KVM_REG_RISCV_CORE);
+	unsigned long regs_max = sizeof(struct kvm_riscv_core) / sizeof(unsigned long);
 	unsigned long reg_val;
 
 	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
 		return -EINVAL;
-	if (reg_num >= sizeof(struct kvm_riscv_core) / sizeof(unsigned long))
+	if (reg_num >= regs_max)
 		return -ENOENT;
 
+	reg_num = array_index_nospec(reg_num, regs_max);
+
 	if (copy_from_user(&reg_val, uaddr, KVM_REG_SIZE(reg->id)))
 		return -EFAULT;
 
@@ -507,10 +515,13 @@ static int kvm_riscv_vcpu_general_get_csr(struct kvm_vcpu *vcpu,
 					  unsigned long *out_val)
 {
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
+	unsigned long regs_max = sizeof(struct kvm_riscv_csr) / sizeof(unsigned long);
 
-	if (reg_num >= sizeof(struct kvm_riscv_csr) / sizeof(unsigned long))
+	if (reg_num >= regs_max)
 		return -ENOENT;
 
+	reg_num = array_index_nospec(reg_num, regs_max);
+
 	if (reg_num == KVM_REG_RISCV_CSR_REG(sip)) {
 		kvm_riscv_vcpu_flush_interrupts(vcpu);
 		*out_val = (csr->hvip >> VSIP_TO_HVIP_SHIFT) & VSIP_VALID_MASK;
@@ -526,10 +537,13 @@ static int kvm_riscv_vcpu_general_set_csr(struct kvm_vcpu *vcpu,
 					  unsigned long reg_val)
 {
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
+	unsigned long regs_max = sizeof(struct kvm_riscv_csr) / sizeof(unsigned long);
 
-	if (reg_num >= sizeof(struct kvm_riscv_csr) / sizeof(unsigned long))
+	if (reg_num >= regs_max)
 		return -ENOENT;
 
+	reg_num = array_index_nospec(reg_num, regs_max);
+
 	if (reg_num == KVM_REG_RISCV_CSR_REG(sip)) {
 		reg_val &= VSIP_VALID_MASK;
 		reg_val <<= VSIP_TO_HVIP_SHIFT;
@@ -548,11 +562,14 @@ static inline int kvm_riscv_vcpu_smstateen_set_csr(struct kvm_vcpu *vcpu,
 						   unsigned long reg_val)
 {
 	struct kvm_vcpu_smstateen_csr *csr = &vcpu->arch.smstateen_csr;
+	unsigned long regs_max = sizeof(struct kvm_riscv_smstateen_csr) /
+		sizeof(unsigned long);
 
-	if (reg_num >= sizeof(struct kvm_riscv_smstateen_csr) /
-		sizeof(unsigned long))
+	if (reg_num >= regs_max)
 		return -EINVAL;
 
+	reg_num = array_index_nospec(reg_num, regs_max);
+
 	((unsigned long *)csr)[reg_num] = reg_val;
 	return 0;
 }
@@ -562,11 +579,14 @@ static int kvm_riscv_vcpu_smstateen_get_csr(struct kvm_vcpu *vcpu,
 					    unsigned long *out_val)
 {
 	struct kvm_vcpu_smstateen_csr *csr = &vcpu->arch.smstateen_csr;
+	unsigned long regs_max = sizeof(struct kvm_riscv_smstateen_csr) /
+		sizeof(unsigned long);
 
-	if (reg_num >= sizeof(struct kvm_riscv_smstateen_csr) /
-		sizeof(unsigned long))
+	if (reg_num >= regs_max)
 		return -EINVAL;
 
+	reg_num = array_index_nospec(reg_num, regs_max);
+
 	*out_val = ((unsigned long *)csr)[reg_num];
 	return 0;
 }

-- 
2.51.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
