Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA459CD4F21
	for <kvm-riscv@archiver.kernel.org>; Sun, 17 May 2026 15:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cf2NiRiLWH/1ySCX8Os5uoE5R3GdkZKYrNikrVYtD2o=; b=2d73leDPA7IREA
	/kcYIw0r8btS9T+8jwEufTBdTZhKJ/+dIGxW4sN+hIDz1Ce9oRiJLwmnLJR+oUdJAhJmx0M4C7kqY
	HWfRDPWhyxUo1lT7pevuasg+UQdCZU2y4p5M7FvUh6j5xsr89mikW4FbAOqb4OgyzxMMNj6nUdUPb
	jRthUwdGSDth/oqWqR7HIQgsCIsXwGPMO2t9wSE+LZDTtv+vtkyCw9+QxfJApBYFdpRtGQ42zBYTG
	9RMKYMT7QywKJBoh8au80/5ihx8dIprDa3Qe4H3IKx0S3rTAB1/LNhi6+TeVvD9A3lTlCuhrpYnWO
	IRFxJzwHeZLaool9+Bkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOdY2-0000000CwI0-1Q1C;
	Sun, 17 May 2026 15:36:58 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOdXz-0000000CwGZ-1zMF;
	Sun, 17 May 2026 15:36:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Lw
	tr9qnrBOw3mc+mOndsjvgIabpD1HP/zVbnoBZ8j0o=; b=XCIRvp6+25uqtelPhd
	08Wy2KLUDrQSxNSIHUpvOigbgi3wUDyDFiKJW51hkakkAyQJ04RJWSmC3e0+T8zb
	q6MvZAApfU9ESbGtt5zdIHnBQWHtX46dU98CWhsvJ6fUa83f7mE/s4eXt6nbcxbl
	khO7+/FtNysW2p0FwdtnQkjYM=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wA3ylwO4AlqyKW7Bw--.10227S7;
	Sun, 17 May 2026 23:35:01 +0800 (CST)
From: Jinyu Tang <tjytimi@163.com>
To: Anup Patel <apatel@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Nutty Liu <nutty.liu@hotmail.com>,
	Jinyu Tang <tjytimi@163.com>
Subject: [PATCH 5/5] KVM: riscv: Fast-path dirty logging write faults
Date: Sun, 17 May 2026 23:34:27 +0800
Message-ID: <20260517153427.94889-6-tjytimi@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260517153427.94889-1-tjytimi@163.com>
References: <20260517153427.94889-1-tjytimi@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wA3ylwO4AlqyKW7Bw--.10227S7
X-Coremail-Antispam: 1Uf129KBjvJXoWxuF4UKw1kCF4Uuw4rZryrJFb_yoW5uF1xpF
	W7K3yY9rWFqF17W34ftwn2vr1Ygws7Wr17JrW3twn8Zrsrtr1Dua1kW347ZF15Jry8Zayf
	ZFs8KrWUCrW093DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zEmFAXUUUUU=
X-Originating-IP: [2408:823d:2011:b54:9f00:c5fa:7b13:491e]
X-CM-SenderInfo: xwm13xlpl6il2tof0z/xtbC8gUelmoJ4CU-TgAA3o
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_083656_373274_B9FBECDA 
X-CRM114-Status: GOOD (  14.35  )
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

With dirty logging enabled, guest writes often fault on an existing 4K
G-stage leaf that was write-protected only for dirty tracking. The slow
path still performs the full fault handling flow and takes mmu_lock for
write, even though the page-table shape does not change.

x86 handles the analogous case in its fast page fault path by atomically
making a writable SPTE writable again when the fault is only a
write-protection fault. Add the same style of fast path for RISC-V. If a
write fault hits an existing 4K leaf in a writable dirty-log memslot,
mark the page dirty and atomically set the PTE writable and dirty under
the read side of mmu_lock.

The dirty bitmap is updated before the PTE becomes writable again. The
PTE D bit is also set so systems that trap on a clear D bit do not fall
back to the slow path for a writable but clean PTE.

Signed-off-by: Jinyu Tang <tjytimi@163.com>
---
 arch/riscv/kvm/mmu.c | 75 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 48f16e52f..980059e09 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -419,6 +419,77 @@ static unsigned long transparent_hugepage_adjust(struct kvm *kvm,
 	return PAGE_SIZE;
 }
 
+static bool kvm_riscv_mmu_dirty_log_write_fault_fast(struct kvm *kvm,
+						     struct kvm_memory_slot *memslot,
+						     gpa_t gpa,
+						     struct kvm_gstage_mapping *out_map)
+{
+	struct kvm_gstage gstage;
+	unsigned long mmu_seq;
+	pte_t old_pte, new_pte;
+	pte_t *ptep;
+	gfn_t gfn = gpa >> PAGE_SHIFT;
+	u32 ptep_level;
+	bool dirty_marked = false;
+	bool ret;
+
+	kvm_riscv_gstage_init(&gstage, kvm);
+	mmu_seq = kvm->mmu_invalidate_seq;
+
+	read_lock(&kvm->mmu_lock);
+
+	if (mmu_invalidate_retry_gfn(kvm, mmu_seq, gfn)) {
+		ret = false;
+		goto out_unlock;
+	}
+
+	if (!kvm_riscv_gstage_get_leaf(&gstage, gpa, &ptep, &ptep_level) ||
+	    ptep_level) {
+		ret = false;
+		goto out_unlock;
+	}
+
+	for (;;) {
+		old_pte = ptep_get(ptep);
+		if (!(pte_val(old_pte) & _PAGE_LEAF)) {
+			ret = false;
+			break;
+		}
+
+		if (!dirty_marked) {
+			mark_page_dirty_in_slot(kvm, memslot, gfn);
+			dirty_marked = true;
+		}
+
+		if ((pte_val(old_pte) & (_PAGE_WRITE | _PAGE_DIRTY)) ==
+		    (_PAGE_WRITE | _PAGE_DIRTY)) {
+			new_pte = old_pte;
+			ret = true;
+			break;
+		}
+
+		new_pte = pte_mkdirty(pte_mkwrite_novma(old_pte));
+
+		if (kvm_riscv_gstage_try_update_pte(&gstage, ptep_level, gpa,
+						    ptep, old_pte, new_pte)) {
+			ret = true;
+			break;
+		}
+		cpu_relax();
+	}
+
+out_unlock:
+	read_unlock(&kvm->mmu_lock);
+
+	if (ret) {
+		out_map->addr = gpa & PAGE_MASK;
+		out_map->level = 0;
+		out_map->pte = new_pte;
+	}
+
+	return ret;
+}
+
 int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 		      gpa_t gpa, unsigned long hva, bool is_write,
 		      struct kvm_gstage_mapping *out_map)
@@ -442,6 +513,10 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 	/* Setup initial state of output mapping */
 	memset(out_map, 0, sizeof(*out_map));
 
+	if (is_write && logging &&
+	    kvm_riscv_mmu_dirty_log_write_fault_fast(kvm, memslot, gpa, out_map))
+		return 0;
+
 	/* We need minimum second+third level pages */
 	ret = kvm_mmu_topup_memory_cache(pcache, kvm->arch.pgd_levels);
 	if (ret) {
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
