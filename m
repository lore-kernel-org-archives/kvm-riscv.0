Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A691C4450A
	for <kvm-riscv@archiver.kernel.org>; Sat, 18 Jul 2026 04:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IkuJuJZqp6yNfzOqSNC/ij8u4EtBh9vquO7jwCoQAO0=; b=4Y68MDLfzU2nHd
	aFf61nZ6sejD+B7CryuWc+ELdAIBBTjDmqxV5GVi3CJN31ErUNH2iGZZVFcbuq1utE/wuzavbLKTi
	8OkwpcYrvsAOL1DFIpMguAZ1+yAPY32c4dEya2c43xSbt9nVYi6vfAp/mmAis/Y+P0O+WBTf4LVhE
	BpqrDmS1hbZ6OuN8IS+J7kMTw4vLfsVNpc+WacqM+osWBWAaeHtpffY9ZOexyiXNduv8C4kEdWi1Z
	z6svFqwPETyWhRR7R3SPgtw2MgsfVcZFeCEjrdxbCnEKmuBBlBO+yQGOJKdBuoBsWzeZ/n3jEF1BG
	88JdTSzkrYkWl4NaCssg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkwpy-00000003gyE-3ng7;
	Sat, 18 Jul 2026 04:39:42 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkwpu-00000003gxf-3RA0;
	Sat, 18 Jul 2026 04:39:41 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowAD3AUCBA1tqdlIuAA--.37050S2;
	Sat, 18 Jul 2026 12:39:30 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] RISC-V: KVM: Avoid one-word masks for SBI v0.1 all-harts
Date: Sat, 18 Jul 2026 12:39:29 +0800
Message-ID: <20260718040000.010.826fe94e-caplitmus-rv@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowAD3AUCBA1tqdlIuAA--.37050S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZF15ZFyUJr1fGF1UuF4kJFb_yoWrXw1UpF
	WfCrZxur4fJF17uw1fXrs0yF1jvaykKan5Gws8K3yFqryagr4Fvr4v93y7AFyUJFyDXF97
	Cr4UWF18uF15JwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9I14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
	4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
	628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCV
	W8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWU
	JVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJb
	IYCTnIWIevJa73UjIFyTuYvjfUoq2MUUUUU
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_213939_223511_24EEB79C 
X-CRM114-Status: GOOD (  12.04  )
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

KVM already treats a NULL hart-mask pointer in SBI v0.1 calls as all
harts, matching OpenSBI's legacy handling. The current handler builds that
target set as (1UL << online_vcpus) - 1 before iterating the mask.

That expression shifts by the type width once the VM has BITS_PER_LONG
online vCPUs, and a single word cannot represent larger VMs. A count-based
mask also selects the wrong IDs when vCPU IDs are sparse.

Handle SEND_IPI with a NULL hart-mask by iterating all online vCPUs
directly. For remote fence calls, use the existing hbase == -1UL
convention so the common fence request helper targets the whole VM
without consulting hmask.

Non-NULL guest hart masks keep the existing v0.1 behavior.

Fixes: a046c2d8578c ("RISC-V: KVM: Reorganize SBI code by moving SBI v0.1 to its own file")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 arch/riscv/kvm/vcpu_sbi_v01.c | 52 ++++++++++++++++++++---------------
 1 file changed, 30 insertions(+), 22 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_sbi_v01.c b/arch/riscv/kvm/vcpu_sbi_v01.c
index c9c323d4577a9..de544ea3f28dc 100644
--- a/arch/riscv/kvm/vcpu_sbi_v01.c
+++ b/arch/riscv/kvm/vcpu_sbi_v01.c
@@ -16,8 +16,9 @@
 static int kvm_sbi_ext_v01_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 				   struct kvm_vcpu_sbi_return *retdata)
 {
-	ulong hmask;
-	int i, ret = 0;
+	ulong hbase = 0, hmask;
+	unsigned long i;
+	int ret = 0;
 	u64 next_cycle;
 	struct kvm_vcpu *rvcpu;
 	struct kvm *kvm = vcpu->kvm;
@@ -46,20 +47,25 @@ static int kvm_sbi_ext_v01_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		ret = kvm_riscv_vcpu_unset_interrupt(vcpu, IRQ_VS_SOFT);
 		break;
 	case SBI_EXT_0_1_SEND_IPI:
-		if (cp->a0)
+		if (cp->a0) {
 			hmask = kvm_riscv_vcpu_unpriv_read(vcpu, false, cp->a0, utrap);
-		else
-			hmask = (1UL << atomic_read(&kvm->online_vcpus)) - 1;
-		if (utrap->scause)
-			break;
-
-		for_each_set_bit(i, &hmask, BITS_PER_LONG) {
-			rvcpu = kvm_get_vcpu_by_id(vcpu->kvm, i);
-			if (!rvcpu)
-				continue;
-			ret = kvm_riscv_vcpu_set_interrupt(rvcpu, IRQ_VS_SOFT);
-			if (ret < 0)
+			if (utrap->scause)
 				break;
+
+			for_each_set_bit(i, &hmask, BITS_PER_LONG) {
+				rvcpu = kvm_get_vcpu_by_id(vcpu->kvm, i);
+				if (!rvcpu)
+					continue;
+				ret = kvm_riscv_vcpu_set_interrupt(rvcpu, IRQ_VS_SOFT);
+				if (ret < 0)
+					break;
+			}
+		} else {
+			kvm_for_each_vcpu(i, rvcpu, kvm) {
+				ret = kvm_riscv_vcpu_set_interrupt(rvcpu, IRQ_VS_SOFT);
+				if (ret < 0)
+					break;
+			}
 		}
 		break;
 	case SBI_EXT_0_1_SHUTDOWN:
@@ -70,29 +76,31 @@ static int kvm_sbi_ext_v01_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	case SBI_EXT_0_1_REMOTE_FENCE_I:
 	case SBI_EXT_0_1_REMOTE_SFENCE_VMA:
 	case SBI_EXT_0_1_REMOTE_SFENCE_VMA_ASID:
-		if (cp->a0)
+		if (cp->a0) {
 			hmask = kvm_riscv_vcpu_unpriv_read(vcpu, false, cp->a0, utrap);
-		else
-			hmask = (1UL << atomic_read(&kvm->online_vcpus)) - 1;
+		} else {
+			hbase = -1UL;
+			hmask = 0;
+		}
 		if (utrap->scause)
 			break;
 
 		if (cp->a7 == SBI_EXT_0_1_REMOTE_FENCE_I)
-			kvm_riscv_fence_i(vcpu->kvm, 0, hmask);
+			kvm_riscv_fence_i(vcpu->kvm, hbase, hmask);
 		else if (cp->a7 == SBI_EXT_0_1_REMOTE_SFENCE_VMA) {
 			vmid = READ_ONCE(vcpu->kvm->arch.vmid.vmid);
 			if (cp->a1 == 0 && cp->a2 == 0)
-				kvm_riscv_hfence_vvma_all(vcpu->kvm, 0, hmask, vmid);
+				kvm_riscv_hfence_vvma_all(vcpu->kvm, hbase, hmask, vmid);
 			else
-				kvm_riscv_hfence_vvma_gva(vcpu->kvm, 0, hmask, cp->a1,
+				kvm_riscv_hfence_vvma_gva(vcpu->kvm, hbase, hmask, cp->a1,
 							  cp->a2, PAGE_SHIFT, vmid);
 		} else {
 			vmid = READ_ONCE(vcpu->kvm->arch.vmid.vmid);
 			if (cp->a1 == 0 && cp->a2 == 0)
-				kvm_riscv_hfence_vvma_asid_all(vcpu->kvm, 0, hmask,
+				kvm_riscv_hfence_vvma_asid_all(vcpu->kvm, hbase, hmask,
 							       cp->a3, vmid);
 			else
-				kvm_riscv_hfence_vvma_asid_gva(vcpu->kvm, 0, hmask,
+				kvm_riscv_hfence_vvma_asid_gva(vcpu->kvm, hbase, hmask,
 							       cp->a1, cp->a2, PAGE_SHIFT,
 							       cp->a3, vmid);
 		}
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
