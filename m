Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46ECBCD4F47
	for <kvm-riscv@archiver.kernel.org>; Sun, 17 May 2026 15:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Ikg9pDjOSO/p8T4119f8l+kE3zR45lvcA8KmiUs/rM=; b=QxipvSQ6dxpGvT
	3TuBu6sEticbPd+//GzR1HAnnmgwhVb7zZL9CgaTXXvBV6o4G5XOXyIKCrpgkFExntGOClWj9RP4O
	gkNNtkDsm5eQ+VJJK+Beh1qlM5RF5DVgNozoyirchwpwieAK4Cuw+581eIbk5n49lVUh2or7Bd5ib
	kJYAGyrZOby0BKlszmWh1OsIEpftD8zgJ3S9HEhHwIqrpEHJO5t1/EnBaI6tyhxZzqossrdGB45Il
	wfKKtyoafD2N1dqMoo5YcBb4t3/4fdBPsYTwm3W3d9g9gPd/UPcEhpuOiDnGFpGdG7XoB/qi7VM42
	eFxW3MxmW5/uJs5rIg9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOdY8-0000000CwMe-05l7;
	Sun, 17 May 2026 15:37:04 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOdY4-0000000CwHv-1dEN;
	Sun, 17 May 2026 15:37:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=9R
	f9BG0sjCh68FBbnMMLHnS9NUGEPuZsSwjCC3kbcqQ=; b=FYbpwpwgIo0lGzFsbz
	hX6xv1NIJRlP3nRIxVATezqUzgrHq/5A4KXMmIk7VE71SuKpt/Nzxj2A7PWUlEse
	PEr0Mxx1WzszTftHSwhtgQ5/kl7kfwGRTuI7kppv30J+qA3REcVo7NG3BPzHKnFv
	WKsylKbvCCwRW7avekh618u8Y=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wA3ylwO4AlqyKW7Bw--.10227S4;
	Sun, 17 May 2026 23:34:55 +0800 (CST)
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
Subject: [PATCH 2/5] KVM: riscv: Use an rwlock for mmu_lock
Date: Sun, 17 May 2026 23:34:24 +0800
Message-ID: <20260517153427.94889-3-tjytimi@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260517153427.94889-1-tjytimi@163.com>
References: <20260517153427.94889-1-tjytimi@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wA3ylwO4AlqyKW7Bw--.10227S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxXFW3uFyfuw1UWw1fXF1DZFb_yoWrZrW7pF
	4q9FZxur1Sqr4kZFZrKF1DZr1DWw4vgw1fJFy5CF95AF4YyrZxZrn29342qr98Jr1xZFZ3
	ZF4DJa45Ar40ywUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziGQ6XUUUUU=
X-Originating-IP: [2408:823d:2011:b54:9f00:c5fa:7b13:491e]
X-CM-SenderInfo: xwm13xlpl6il2tof0z/xtbC0B8clGoJ4B+ytQAA3c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_083700_772752_641ED7C0 
X-CRM114-Status: UNSURE (   9.82  )
X-CRM114-Notice: Please train this message.
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

RISC-V KVM currently uses a spinlock for mmu_lock. That serializes all
G-stage MMU operations, including permission-only updates that do not
allocate or free page-table pages.

Use KVM's rwlock form of mmu_lock, as x86 and arm64 already do. Keep the
existing map, unmap and teardown paths on the write side. This prepares
RISC-V for read-side handling of G-stage permission updates.

Signed-off-by: Jinyu Tang <tjytimi@163.com>
---
 arch/riscv/include/asm/kvm_host.h |  2 ++
 arch/riscv/kvm/gstage.c           |  2 +-
 arch/riscv/kvm/mmu.c              | 24 ++++++++++++------------
 3 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 75b0a951c..60017ceec 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -48,6 +48,8 @@
 
 #define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS_RANGE
 
+#define KVM_HAVE_MMU_RWLOCK
+
 #define KVM_DIRTY_LOG_MANUAL_CAPS	(KVM_DIRTY_LOG_MANUAL_PROTECT_ENABLE | \
 					 KVM_DIRTY_LOG_INITIALLY_SET)
 
diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index d9fe8be2a..6f934cb4a 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -410,7 +410,7 @@ void kvm_riscv_gstage_unmap_range(struct kvm_gstage *gstage,
 		 * to prevent starvation and lockup detector warnings.
 		 */
 		if (!(gstage->flags & KVM_GSTAGE_FLAGS_LOCAL) && may_block && addr < end)
-			cond_resched_lock(&gstage->kvm->mmu_lock);
+			cond_resched_rwlock_write(&gstage->kvm->mmu_lock);
 	}
 }
 
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 0197e41fc..48f16e52f 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -26,9 +26,9 @@ static void mmu_wp_memory_region(struct kvm *kvm, int slot)
 
 	kvm_riscv_gstage_init(&gstage, kvm);
 
-	spin_lock(&kvm->mmu_lock);
+	write_lock(&kvm->mmu_lock);
 	kvm_riscv_gstage_wp_range(&gstage, start, end);
-	spin_unlock(&kvm->mmu_lock);
+	write_unlock(&kvm->mmu_lock);
 	kvm_flush_remote_tlbs_memslot(kvm, memslot);
 }
 
@@ -65,9 +65,9 @@ int kvm_riscv_mmu_ioremap(struct kvm *kvm, gpa_t gpa, phys_addr_t hpa,
 		if (ret)
 			goto out;
 
-		spin_lock(&kvm->mmu_lock);
+		write_lock(&kvm->mmu_lock);
 		ret = kvm_riscv_gstage_set_pte(&gstage, &pcache, &map);
-		spin_unlock(&kvm->mmu_lock);
+		write_unlock(&kvm->mmu_lock);
 		if (ret)
 			goto out;
 
@@ -85,9 +85,9 @@ void kvm_riscv_mmu_iounmap(struct kvm *kvm, gpa_t gpa, unsigned long size)
 
 	kvm_riscv_gstage_init(&gstage, kvm);
 
-	spin_lock(&kvm->mmu_lock);
+	write_lock(&kvm->mmu_lock);
 	kvm_riscv_gstage_unmap_range(&gstage, gpa, size, false);
-	spin_unlock(&kvm->mmu_lock);
+	write_unlock(&kvm->mmu_lock);
 }
 
 void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
@@ -131,9 +131,9 @@ void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
 
 	kvm_riscv_gstage_init(&gstage, kvm);
 
-	spin_lock(&kvm->mmu_lock);
+	write_lock(&kvm->mmu_lock);
 	kvm_riscv_gstage_unmap_range(&gstage, gpa, size, false);
-	spin_unlock(&kvm->mmu_lock);
+	write_unlock(&kvm->mmu_lock);
 }
 
 void kvm_arch_commit_memory_region(struct kvm *kvm,
@@ -504,7 +504,7 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 	if (logging && !is_write)
 		writable = false;
 
-	spin_lock(&kvm->mmu_lock);
+	write_lock(&kvm->mmu_lock);
 
 	if (mmu_invalidate_retry(kvm, mmu_seq))
 		goto out_unlock;
@@ -527,7 +527,7 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 
 out_unlock:
 	kvm_release_faultin_page(kvm, page, ret && ret != -EEXIST, writable);
-	spin_unlock(&kvm->mmu_lock);
+	write_unlock(&kvm->mmu_lock);
 	return ret;
 }
 
@@ -556,7 +556,7 @@ void kvm_riscv_mmu_free_pgd(struct kvm *kvm)
 	struct kvm_gstage gstage;
 	void *pgd = NULL;
 
-	spin_lock(&kvm->mmu_lock);
+	write_lock(&kvm->mmu_lock);
 	if (kvm->arch.pgd) {
 		kvm_riscv_gstage_init(&gstage, kvm);
 		kvm_riscv_gstage_unmap_range(&gstage, 0UL,
@@ -566,7 +566,7 @@ void kvm_riscv_mmu_free_pgd(struct kvm *kvm)
 		kvm->arch.pgd_phys = 0;
 		kvm->arch.pgd_levels = 0;
 	}
-	spin_unlock(&kvm->mmu_lock);
+	write_unlock(&kvm->mmu_lock);
 
 	if (pgd)
 		free_pages((unsigned long)pgd, get_order(kvm_riscv_gstage_pgd_size));
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
