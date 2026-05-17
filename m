Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F635CD37AC
	for <kvm-riscv@archiver.kernel.org>; Sun, 17 May 2026 15:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=obpJMSAdybw7yDNwblFVMXj61RArz7g9KKHMBspuns0=; b=BMtdWTM7UH/XhJ
	yJtkztPBpS4eQLronu4EmRB+RMUr+CerEot2eo8xuHg0LruYa6w8Su/1deua/17xmLcFjq/JZrRh7
	ifUFdw1Z27xai14P2KkK3PHdkqIV+ov4iXWjpjHO0I5Y4B7muYMyfBGsFBx1oAmuTQftIn4qsSAZA
	K81NyZRlzNCDy3dXUOXmC2JXO8LnIPfYQixuKAIq7Vrx6R1qhAoqxI9S/BXIWr2/QO8+nHG+/UOlJ
	i3RJ5TJQoD356/L3bykvoMvwNjr1sLhA7mMsFekwSFW6wwIInNEv+GL2wbw1lUCH1O8iKnLOC9Rfo
	Yzi1Nzqj21uF2jAcILgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOdYB-0000000CwQU-10mG;
	Sun, 17 May 2026 15:37:07 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOdY8-0000000CwK8-0TK0;
	Sun, 17 May 2026 15:37:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Js
	QLXeUloxPxSDxUurZ8XAjjViIbjwSl2vEzwM1rPDs=; b=Ag3HJO3k8B2qchnUoR
	9HXK3xEF+q/x78VQ12mLVpxXO8uIvXu82vwdwcH84Je4028gRVJ3/vXIkH4HvaMP
	I1qxKZFHcNOBlOgUYLOHkfazAD6ypzCHTyDMvYT3pNapRJsdkDZISK/NYz5pWEnc
	/ccQVlqHy8hFx3GraoNcGFwQc=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wA3ylwO4AlqyKW7Bw--.10227S3;
	Sun, 17 May 2026 23:34:41 +0800 (CST)
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
Subject: [PATCH 1/5] KVM: riscv: Rely on common MMU notifier locking
Date: Sun, 17 May 2026 23:34:23 +0800
Message-ID: <20260517153427.94889-2-tjytimi@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260517153427.94889-1-tjytimi@163.com>
References: <20260517153427.94889-1-tjytimi@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wA3ylwO4AlqyKW7Bw--.10227S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Aw4fGw1xAFWxtw1DAF4UCFg_yoW8Arykpr
	WjkrZ0krWrXr4DuFyUt3WkZryj9w4vgFn7X34rJaykJrs0q3s3Ga4vqas2gF15Jrs5XFZx
	ZF40q3WrCry5AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piaFAZUUUUU=
X-Originating-IP: [2408:823d:2011:b54:9f00:c5fa:7b13:491e]
X-CM-SenderInfo: xwm13xlpl6il2tof0z/xtbC0BEZkWoJ4BGw1wAA38
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_083704_578114_C0BE863A 
X-CRM114-Status: UNSURE (   7.55  )
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

The common KVM invalidation paths call kvm_unmap_gfn_range() with
mmu_lock already held for write.

For the standard MMU notifier path, the call chain is:

  kvm_mmu_notifier_invalidate_range_start()
    kvm_handle_hva_range()
      kvm_unmap_gfn_range()

kvm_mmu_notifier_invalidate_range_start() leaves range.lockless clear.
kvm_handle_hva_range() therefore takes KVM_MMU_LOCK(kvm) before invoking
the handler.

The guest_memfd path has the same locking contract:

  __kvm_gmem_invalidate_begin()
    kvm_mmu_unmap_gfn_range()
      kvm_unmap_gfn_range()

__kvm_gmem_invalidate_begin() explicitly takes KVM_MMU_LOCK(kvm) before
calling kvm_mmu_unmap_gfn_range().

So remove the local trylock and make the common locking contract explicit 
with lockdep_assert_held_write() like x86.

Signed-off-by: Jinyu Tang <tjytimi@163.com>
---
 arch/riscv/kvm/mmu.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 2d3def024..0197e41fc 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -230,18 +230,16 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
 {
 	struct kvm_gstage gstage;
-	bool mmu_locked;
 
 	if (!kvm->arch.pgd)
 		return false;
 
+	lockdep_assert_held_write(&kvm->mmu_lock);
+
 	kvm_riscv_gstage_init(&gstage, kvm);
-	mmu_locked = spin_trylock(&kvm->mmu_lock);
 	kvm_riscv_gstage_unmap_range(&gstage, range->start << PAGE_SHIFT,
 				     (range->end - range->start) << PAGE_SHIFT,
 				     range->may_block);
-	if (mmu_locked)
-		spin_unlock(&kvm->mmu_lock);
 	return false;
 }
 
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
