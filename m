Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84501CA0EFA
	for <kvm-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 12:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WpEulQfaToj5MLjcdaDSeDxZHE/OE0ATOMg4I3gRjAY=; b=xJcwRfEgtO5lqH
	VOMWalQTNufPkm01D81T2eVnZfKnXNDwpGs9GPOFUmTr1wrAiJX+K/Mr+3F76tMaE+YrgAbFxqO4+
	6dEk4m1KV+2D+yTEOPKabPfzUMlmWRibtK2DE6XdDDUoX2MXtuS/duZZqdHwcz2PWajqV1BWYbAm/
	YP+eSAaCfjhTNY+i8Fr9jabzgZy8lVxBLPpXR9ZaWSl30mvsAh38+YaMAjJi7winxW97wa+LB4wWw
	zu5e1myXac5fy5UDG+D+rfpoi7uEPoucZ4IYXG5RjIcMvElXAsYO8TA1anTF+ia88xeAK4HCZCHbn
	lYvudjPxZFtWMPxp52hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqWjB-00000007zxU-2lKT;
	Mon, 25 Aug 2025 12:55:13 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqW64-00000007tSx-22Z6;
	Mon, 25 Aug 2025 12:14:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=wm
	j5n76lJI+EQ4fSCNHd5tg/1m0AUVHlQPLj3ohhhUY=; b=oesLLvfIRErVrkDogt
	a1OiIZOZxwCxnyD4vqmBrnVVnRE80lSQFCaARmR+gtW5WcBIqVPm0z8/9JginPJi
	BJSCAAwBOWQ0Aaaza4t++VbR9D/xdZ4ULSDfoDFvbUDgzCkA4qdjYYMSMerFg3Sb
	bq23otVjkEWrLMTDxEZQrHoFc=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wCn0LeWU6xoYo0IEQ--.6105S2;
	Mon, 25 Aug 2025 20:14:15 +0800 (CST)
From: Jinyu Tang <tjytimi@163.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Nutty Liu <nutty.liu@hotmail.com>
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jinyu Tang <tjytimi@163.com>
Subject: [PATCH v3] riscv: skip csr restore if vcpu preempted reload
Date: Mon, 25 Aug 2025 20:14:11 +0800
Message-ID: <20250825121411.86573-1-tjytimi@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CM-TRANSID: _____wCn0LeWU6xoYo0IEQ--.6105S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxuryrZw13Kr13uF15tw47Jwb_yoW5Ww48pF
	W7urs09w48JrW7G342qrsY9F4F9rZYgrn3XryDWrWSyr1Utr9Yyr4kK3y7AFy5GryrZF1S
	yFyDtFyIkFnYvwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piHa0PUUUUU=
X-Originating-IP: [2408:823d:2011:2f19:6887:e830:50c:ac99]
X-CM-SenderInfo: xwm13xlpl6il2tof0z/1tbipR+0eGisTjSwYwAAsb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_051448_966721_7F2493FA 
X-CRM114-Status: GOOD (  13.17  )
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

The kvm_arch_vcpu_load() function is called in two cases for riscv:
1. When entering KVM_RUN from userspace ioctl.
2. When a preempted VCPU is scheduled back.

In the second case, if no other KVM VCPU has run on this CPU since the
current VCPU was preempted, the guest CSR (including AIA CSRS and HGTAP) 
values are still valid in the hardware and do not need to be restored.

This patch is to skip the CSR write path when:
1. The VCPU was previously preempted
(vcpu->scheduled_out == 1).
2. It is being reloaded on the same physical CPU
(vcpu->arch.last_exit_cpu == cpu).
3. No other KVM VCPU has used this CPU in the meantime
(vcpu == __this_cpu_read(kvm_former_vcpu)).

This reduces many CSR writes with frequent preemption on the same CPU.

Signed-off-by: Jinyu Tang <tjytimi@163.com>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
---
 v2 -> v3:
 v2 was missing a critical check because I generated the patch from my
 wrong (experimental) branch. This is fixed in v3. Sorry for my trouble.

 v1 -> v2:
 Apply the logic to aia csr load. Thanks for
 Andrew Jones's advice.

 arch/riscv/kvm/vcpu.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index f001e5640..66bd3ddd5 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -25,6 +25,8 @@
 #define CREATE_TRACE_POINTS
 #include "trace.h"
 
+static DEFINE_PER_CPU(struct kvm_vcpu *, kvm_former_vcpu);
+
 const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
 	KVM_GENERIC_VCPU_STATS(),
 	STATS_DESC_COUNTER(VCPU, ecall_exit_stat),
@@ -581,6 +583,10 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
 	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
 
+	if (vcpu->scheduled_out && vcpu == __this_cpu_read(kvm_former_vcpu) &&
+		vcpu->arch.last_exit_cpu == cpu)
+		goto csr_restore_done;
+
 	if (kvm_riscv_nacl_sync_csr_available()) {
 		nsh = nacl_shmem();
 		nacl_csr_write(nsh, CSR_VSSTATUS, csr->vsstatus);
@@ -624,6 +630,9 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 
 	kvm_riscv_mmu_update_hgatp(vcpu);
 
+	kvm_riscv_vcpu_aia_load(vcpu, cpu);
+
+csr_restore_done:
 	kvm_riscv_vcpu_timer_restore(vcpu);
 
 	kvm_riscv_vcpu_host_fp_save(&vcpu->arch.host_context);
@@ -633,8 +642,6 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	kvm_riscv_vcpu_guest_vector_restore(&vcpu->arch.guest_context,
 					    vcpu->arch.isa);
 
-	kvm_riscv_vcpu_aia_load(vcpu, cpu);
-
 	kvm_make_request(KVM_REQ_STEAL_UPDATE, vcpu);
 
 	vcpu->cpu = cpu;
@@ -645,6 +652,8 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 	void *nsh;
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
 
+	__this_cpu_write(kvm_former_vcpu, vcpu);
+
 	vcpu->cpu = -1;
 
 	kvm_riscv_vcpu_aia_put(vcpu);
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
