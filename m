Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DAAE9A02C
	for <kvm-riscv@archiver.kernel.org>; Sun, 22 Feb 2026 04:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Nb96kjsjtyBUw+ZOKwgkVhFEktKQNKhV1bzqLhlxwB8=; b=dhmwWZ/0KDvzxw
	70jGXAwvacAGugNam8hlTLFII5IHJ5r4Brst+DXbQ7F1drbLqvDjaQIL9g8iIFo7qnN2fUutJt1/h
	Cy8XhOf4voAjyF4B4B8cuzXSXWQevCQTYmkACzMJl+Zg9OFUZ40uwpD7uJ7Igb5AGO3x9XIzTWs3P
	cNsZEwu1CHbFkThjdX3UwCK1BSRt4MR82s/Rw9qeIGegpxnYYtQri0MNNN+dcdf5RrPuKQTdGUAqG
	xjVaHdU6ck3RBg1nkYfWcPiLmgq6QQyWOL3ZbkaHphrJ51pNZ+sg7ry0eLhw4VJY+KZ0myIfJo/hB
	p6oMrwIR1la6n2p0u12g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vu1YV-0000000GU43-3I3A;
	Sun, 22 Feb 2026 04:58:58 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vu1YS-0000000GU37-2lMo;
	Sun, 22 Feb 2026 04:58:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=V4
	D22IhydwIrtHinjeBvBPepXWOWYmBE/Ufcmj1uLY8=; b=QfOrsMxr6EYsKqPEYN
	88oFDNvUEQxopdllt0Plau4zWl9ZEjtxwZCUukwEeBcxZtxZX8s7sX13bjQq6jeV
	l3RKkFy7bqY9gm1RmTSYFOfVYX6FSX//GrlEeRzfTA2DhJE0dN12DCUVvMxIh0Hm
	rptn3vblFO4TN+rAxChNLqYS4=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wC3WqLHjJpp_NHdMA--.21662S2;
	Sun, 22 Feb 2026 12:57:44 +0800 (CST)
From: Jinyu Tang <tjytimi@163.com>
To: anup@brainfault.org
Cc: atish.patra@linux.dev,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	yongxuan.wang@sifive.com,
	nutty.liu@hotmail.com,
	paul.walmsley@sifive.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jinyu Tang <tjytimi@163.com>
Subject: [PATCH v4] KVM: riscv: Skip CSR restore if VCPU is reloaded on the same core
Date: Sun, 22 Feb 2026 12:57:41 +0800
Message-ID: <20260222045741.260325-1-tjytimi@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CM-TRANSID: _____wC3WqLHjJpp_NHdMA--.21662S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAFy5tw1xXrWDtr17ZF47Jwb_yoWrtrW5pF
	W7Crs5Ww48Gr15G347Xr4v9r4FgrZYgw1fX34UW3ySyr4Utry5AFs5KrWUAFZ8GrW8ZFyI
	yF1DKF109Fn0vw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pR58nOUUUUU=
X-Originating-IP: [2408:823c:2011:2c65:d9c1:3ebe:3320:1144]
X-CM-SenderInfo: xwm13xlpl6il2tof0z/xtbC8glWzmmajMmgyAAA39
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_205853_062837_C9FF8928 
X-CRM114-Status: GOOD (  16.37  )
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
HGATP. However, when a preempted VCPU is scheduled back on the same
physical CPU, and no other KVM VCPU has run on this CPU in the meantime,
the hardware CSRs are still valid.

This patch optimizes the vcpu_load path by skipping the expensive CSR
writes if all the following conditions are met:
1. The VCPU was previously preempted (vcpu->scheduled_out == 1).
2. It is being reloaded on the same CPU (vcpu->arch.last_exit_cpu == cpu).
3. No other VCPU used this CPU (vcpu == __this_cpu_read(kvm_former_vcpu)).
4. The CSRs are not dirty (!vcpu->arch.csr_dirty).

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
 arch/riscv/kvm/vcpu.c             | 13 +++++++++++++
 arch/riscv/kvm/vcpu_onereg.c      |  3 +++
 3 files changed, 19 insertions(+)

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
index a55a95da5..f7f58f02c 100644
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
@@ -537,6 +539,9 @@ int kvm_arch_vcpu_ioctl_set_guest_debug(struct kvm_vcpu *vcpu,
 		vcpu->arch.cfg.hedeleg |= BIT(EXC_BREAKPOINT);
 	}
 
+	/* Mark CSRs dirty on hedeleg update */
+	vcpu->arch.csr_dirty = true;
+
 	return 0;
 }
 
@@ -581,6 +586,11 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
 	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
 
+	if (vcpu->scheduled_out && vcpu == __this_cpu_read(kvm_former_vcpu) &&
+		vcpu->arch.last_exit_cpu == cpu && !vcpu->arch.csr_dirty)
+		goto csr_restore_done;
+
+	vcpu->arch.csr_dirty = false;
 	if (kvm_riscv_nacl_sync_csr_available()) {
 		nsh = nacl_shmem();
 		nacl_csr_write(nsh, CSR_VSSTATUS, csr->vsstatus);
@@ -624,6 +634,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 
 	kvm_riscv_mmu_update_hgatp(vcpu);
 
+csr_restore_done:
 	kvm_riscv_vcpu_timer_restore(vcpu);
 
 	kvm_riscv_vcpu_host_fp_save(&vcpu->arch.host_context);
@@ -645,6 +656,8 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 	void *nsh;
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
 
+	__this_cpu_write(kvm_former_vcpu, vcpu);
+
 	vcpu->cpu = -1;
 
 	kvm_riscv_vcpu_aia_put(vcpu);
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index e7ab6cb00..88cfcb018 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -652,6 +652,9 @@ static int kvm_riscv_vcpu_set_reg_csr(struct kvm_vcpu *vcpu,
 	if (rc)
 		return rc;
 
+	/* Mark CSRs dirty after userspace update csr */
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
