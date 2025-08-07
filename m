Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B9F9C87FCA
	for <kvm-riscv@archiver.kernel.org>; Thu,  7 Aug 2025 11:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FlgzkcXSD6iEOJv6ezM43mOzswazmLTIPHm5wkH+4H0=; b=cC6yNHsvEnSenQ
	vOubTsmrvdE91WyXpGmECJhDavYmB8h3P8bc6fZ9fjnNY1ONn2Tc9MchgZrm/DyIpePPmit5l30GO
	7YJvXV0k3JxSRCzjEH80IC76D1bZCPOgqg8GpJq0uei++cEKq0reKvARBYvnGYOMVeJMQXl1Mf8dJ
	RC8/jmz84UR/v/4wtnzLfmvpGbIUp+9GwpYgpYiybsLYbo2bJUNwiGHZrMi4GijvsBeDgNtneEnaP
	S3X8KRmdqJj1dtwvlePHpV5auJ6adDriMjatPYNfp+5JDXxFtkxGcb+FlaMh1cZnkNudFy+9m+dC6
	egeooqTGHFzvrUMOcekg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujz1E-00000000Pjp-08Y9;
	Thu, 07 Aug 2025 11:42:48 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujz1B-00000000PiJ-18Sj;
	Thu, 07 Aug 2025 11:42:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=PW
	fzr+zJFrTN7MTaKivF+UZ6XkZSxRB/9DJOS9UoMB8=; b=JwujuNOMcl4UvRSpqf
	3eT61Q+mXki1B9CRP4j2VycuCRGagDiQWtfVEk0WCi3LLiuqs9S4kBVG2OKbC+iZ
	G7kibZ4Fv8TVKgPF/EdfamOadLKVcL5si4EMeC8AonvhnOnT+Q996MHLGQsxcoSp
	8gR5Xqv8D5GwCw2qFihwq6I5A=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3H0cfkZRojzptAQ--.275S2;
	Thu, 07 Aug 2025 19:42:24 +0800 (CST)
From: Jinyu Tang <tjytimi@163.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jinyu Tang <tjytimi@163.com>
Subject: [PATCH] riscv: skip csr restore if vcpu preempted reload
Date: Thu,  7 Aug 2025 19:42:20 +0800
Message-ID: <20250807114220.559098-1-tjytimi@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CM-TRANSID: _____wD3H0cfkZRojzptAQ--.275S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFy8XF47Gr18ZF43Jw17Awb_yoW8tF15pF
	W7urs09w48JrW7G342qrs5uF4FvrsYgrn3Xr9rXrWfAr15tryFyF4kKa47AFW5GrWrZF1S
	yF1ktFyxC3Z5ZwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piSdgJUUUUU=
X-Originating-IP: [2408:823d:2011:2cd5:d0cd:157d:75c9:b2da]
X-CM-SenderInfo: xwm13xlpl6il2tof0z/1tbiZRKieGiUfiGXWQABsB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_044245_666568_00691988 
X-CRM114-Status: GOOD (  10.07  )
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
current VCPU was preempted, the guest CSR values are still valid in
the hardware and do not need to be restored.

This patch is to skip the CSR write path when:
1. The VCPU was previously preempted
(vcpu->scheduled_out == 1).
2. It is being reloaded on the same physical CPU
(vcpu->arch.last_exit_cpu == cpu).
3. No other KVM VCPU has used this CPU in the meantime
(vcpu == __this_cpu_read(kvm_former_vcpu)).

This reduces many CSR writes with frequent preemption on the same CPU.

Signed-off-by: Jinyu Tang <tjytimi@163.com>
---
 arch/riscv/kvm/vcpu.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index f001e5640..1c6c55ee1 100644
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
@@ -624,6 +630,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 
 	kvm_riscv_mmu_update_hgatp(vcpu);
 
+csr_restore_done:
 	kvm_riscv_vcpu_timer_restore(vcpu);
 
 	kvm_riscv_vcpu_host_fp_save(&vcpu->arch.host_context);
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
