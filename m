Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190B4FCE068
	for <kvm-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 12:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ut0NXyMSFm6DuYvDdy7AKw0dt3j1yPFBHYTW74LvFzM=; b=xEPOAEs7a5qlNS
	sxFOA1ljX2ijMmya6zF9PSjwMxpNBDJ3GE78fWP8b/fEufbUSm2+nJ2xvMQM5lrrUzct3M8mg8iM2
	UEdk3PoTrEUHX692QU0lSg5gX+MHlqDHnxSCKTPG2njtPumQV0A1m/1Ut6wrzPqhHu6siSpOrXTTU
	FwcT0DAle8fsR61EzZspLpPy0W5AnELACH3ZUqRt8bcrEFgmHM5Vw4ePzzl0iNBy1+ps3FYni6E1B
	MifFkcx1GQaW1bWqn49hTkF4Hv6VyOQsqlMuCyCksmmujHJxEz9nUgyAawB7y/xTOvC7fLkWjQenr
	O0xOPyM23wrUuq7s7tHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvae8-000000068cN-3KdS;
	Thu, 26 Feb 2026 12:39:12 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvae5-000000068bI-1W7B;
	Thu, 26 Feb 2026 12:39:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Y2
	dSiRAjxppeg7/bGSsyFayGIlsunKAgYoY2n1sc7os=; b=pPqNYmPqDBptzKg1gY
	xGF6A0ig0IRHqUa5DKQJfT+ziY/j/oM3HfaUoIPiLFWu7NyGmrjzSollUMGOzkUv
	nNtSeNvgOnXctNOkbWZutFtgdnXyobC7jP09pm83J4YIluoep+bqciW15esTVvKX
	MBJc1ktGn2nvA5H+SZ2yINfbw=
Received: from whoami-MS-7D95.. (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wBXnkmsPqBppcMFMw--.51195S2;
	Thu, 26 Feb 2026 20:38:05 +0800 (CST)
From: Jinyu Tang <tjytimi@163.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Nutty Liu <nutty.liu@hotmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jinyu Tang <tjytimi@163.com>
Subject: [PATCH v6] KVM: riscv: Skip CSR restore if VCPU is reloaded on the same core
Date: Thu, 26 Feb 2026 20:38:02 +0800
Message-ID: <20260226123802.154855-1-tjytimi@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CM-TRANSID: _____wBXnkmsPqBppcMFMw--.51195S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3WrWxurWxXr4xXr4xCw1UGFg_yoW7ZF15pF
	W7CFn5Ww48Gr13G347Xr4v9r4YgwsYgw1fJ34UZ3yayr45try5AFs5KFyUAFZ8GrW8ZFyS
	yF1DtFy09Fn0vaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pROdbbUUUUU=
X-Originating-IP: [2408:823c:2011:64d4:ceda:9d2a:733a:aa1c]
X-CM-SenderInfo: xwm13xlpl6il2tof0z/xtbC0A09tWmgPq1brgAA36
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_043909_933615_6B3A45CA 
X-CRM114-Status: GOOD (  21.41  )
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

Currently, kvm_arch_vcpu_load() unconditionally restores guest CSRs and
HGATP. However, when a VCPU is loaded back on the same physical CPU,
and no other KVM VCPU has run on this CPU since it was last put,
the hardware CSRs are still valid.

This patch optimizes the vcpu_load path by skipping the expensive CSR
writes if all the following conditions are met:
1. It is being reloaded on the same CPU (vcpu->arch.last_exit_cpu == cpu).
2. The CSRs are not dirty (!vcpu->arch.csr_dirty).
3. No other VCPU used this CPU (vcpu == __this_cpu_read(kvm_former_vcpu)).

To ensure this fast-path doesn't break corner cases:
- Live migration and VCPU reset are naturally safe. KVM initializes
  last_exit_cpu to -1, which guarantees the fast-path won't trigger.
- A new 'csr_dirty' flag is introduced to track runtime userspace
  interventions. If userspace modifies guest configurations (e.g.,
  hedeleg via KVM_SET_GUEST_DEBUG, or CSRs via KVM_SET_ONE_REG) while
  the VCPU is preempted, the flag is set to skip fast path.

Note that kvm_riscv_vcpu_aia_load() is kept outside the skip logic
to ensure IMSIC/AIA interrupt states are always properly
synchronized.

Signed-off-by: Jinyu Tang <tjytimi@163.com>
---
 v5 -> v6:
 As suggested by Andrew Jones, checking 'last_exit_cpu' first (most
 likely to fail on busy hosts) and placing the expensive
 __this_cpu_read() last, skipping __this_cpu_write() in kvm_arch_vcpu_put()
 if kvm_former_vcpu is already set to the current VCPU.

 v4 -> v5:
 - Dropped the 'vcpu->scheduled_out' check as Andrew Jones pointed out,
   relying on 'last_exit_cpu', 'former_vcpu', and '!csr_dirty'
   is sufficient and safe. This expands the optimization to cover many
   userspace exits (e.g., MMIO) as well.
 - Added a block comment in kvm_arch_vcpu_load() to warn future
   developers about maintaining the 'csr_dirty' dependency, as Andrew's
   suggestion to reduce fragility.
 - Removed unnecessary single-line comments and fixed indentation nits.

 v3 -> v4:
 - Addressed Anup Patel's review regarding hardware state inconsistency.
 - Introduced 'csr_dirty' flag to track dynamic userspace CSR/CONFIG
   modifications (KVM_SET_ONE_REG, KVM_SET_GUEST_DEBUG), forcing a full
   restore when debugging or modifying states at userspace.
 - Kept kvm_riscv_vcpu_aia_load() out of the skip block to resolve IMSIC
   VS-file instability.

 v2 -> v3:
 v2 was missing a critical check because I generated the patch from my
 wrong (experimental) branch. This is fixed in v3. Sorry for my trouble.

 v1 -> v2:
 Apply the logic to aia csr load. Thanks for Andrew Jones's advice.
---
 arch/riscv/include/asm/kvm_host.h |  3 +++
 arch/riscv/kvm/vcpu.c             | 22 ++++++++++++++++++++++
 arch/riscv/kvm/vcpu_onereg.c      |  2 ++
 3 files changed, 27 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 24585304c..7ee47b83c 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -273,6 +273,9 @@ struct kvm_vcpu_arch {
 	/* 'static' configurations which are set only once */
 	struct kvm_vcpu_config cfg;
 
+	/* Indicates modified guest CSRs */
+	bool csr_dirty;
+
 	/* SBI steal-time accounting */
 	struct {
 		gpa_t shmem;
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index a55a95da5..ff51a312d 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -24,6 +24,8 @@
 #define CREATE_TRACE_POINTS
 #include "trace.h"
 
+static DEFINE_PER_CPU(struct kvm_vcpu *, kvm_former_vcpu);
+
 const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
 	KVM_GENERIC_VCPU_STATS(),
 	STATS_DESC_COUNTER(VCPU, ecall_exit_stat),
@@ -537,6 +539,8 @@ int kvm_arch_vcpu_ioctl_set_guest_debug(struct kvm_vcpu *vcpu,
 		vcpu->arch.cfg.hedeleg |= BIT(EXC_BREAKPOINT);
 	}
 
+	vcpu->arch.csr_dirty = true;
+
 	return 0;
 }
 
@@ -581,6 +585,20 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
 	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
 
+	/*
+	 * If VCPU is being reloaded on the same physical CPU and no
+	 * other KVM VCPU has run on this CPU since it was last put,
+	 * we can skip the expensive CSR and HGATP writes.
+	 *
+	 * Note: If a new CSR is added to this fast-path skip block,
+	 * make sure that 'csr_dirty' is set to true in any
+	 * ioctl (e.g., KVM_SET_ONE_REG) that modifies it.
+	 */
+	if (vcpu->arch.last_exit_cpu == cpu && !vcpu->arch.csr_dirty &&
+	    vcpu == __this_cpu_read(kvm_former_vcpu))
+		goto csr_restore_done;
+
+	vcpu->arch.csr_dirty = false;
 	if (kvm_riscv_nacl_sync_csr_available()) {
 		nsh = nacl_shmem();
 		nacl_csr_write(nsh, CSR_VSSTATUS, csr->vsstatus);
@@ -624,6 +642,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 
 	kvm_riscv_mmu_update_hgatp(vcpu);
 
+csr_restore_done:
 	kvm_riscv_vcpu_timer_restore(vcpu);
 
 	kvm_riscv_vcpu_host_fp_save(&vcpu->arch.host_context);
@@ -645,6 +664,9 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 	void *nsh;
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
 
+	if (vcpu != __this_cpu_read(kvm_former_vcpu))
+		__this_cpu_write(kvm_former_vcpu, vcpu);
+
 	vcpu->cpu = -1;
 
 	kvm_riscv_vcpu_aia_put(vcpu);
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index e7ab6cb00..fc08bf833 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -652,6 +652,8 @@ static int kvm_riscv_vcpu_set_reg_csr(struct kvm_vcpu *vcpu,
 	if (rc)
 		return rc;
 
+	vcpu->arch.csr_dirty = true;
+
 	return 0;
 }
 
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
