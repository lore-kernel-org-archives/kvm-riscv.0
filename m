Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA361C982F1
	for <kvm-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 11:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=370kYTYMUxnzIxdQCGE4UzRBq5/bkhmwmyLNL7Kv6Yw=; b=b1BWubhgWIxGSA
	UYCwY4P9+MhCplECeP86Q2zJbSEv6SfUPsD00gQaYv+BEWZTjwtBC/Oq7zsxEXSEZOseco3NDywDE
	58InughQM/TOVJj6q0Dbvgbes2TQUwLTEg94NaPNckLBehR3g30dCc4agsFZGFbZh2PHtjHgHDQar
	ZQjg0MH/QcbbrFZxKC/H1hAphwqx9v5qhXpkVs7rGNH6WtcMv6y3vOrm/03Nagc8dhvT5GeVBFyiL
	4KZ2kzAXrh24QT2E1RGXm7nBJS3LKFfDMV7elvvGFcUxE6z8o9h5plkPeSYC1K4WbchWZJOlAP3k9
	b9wJ/4Ilh6id3mlExj4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8byu-00000001qKo-1X9G;
	Mon, 21 Sep 2026 11:14:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bys-00000001qHN-0BaD
	for kvm-riscv@bombadil.infradead.org;
	Mon, 21 Sep 2026 11:14:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=4xMVi+cD5sodYKE++E9vQWOcZxlG7jO/nwtdaiSfROQ=; b=ddKem4njjCE7OrzQQwEzOKct5/
	2ig9VwWLWDeP+LfmbIVKPRoCCWdM0wrMwaa0NZ555qhsp5WStyzQxhcXua71HZwTy8PejUNZpzPAW
	N41tHneay0IldGT0dY6XRBd3zVl11r8Z5OlVHKm+JO+Abdge2ugsbOaQHH7pmZQe1cZs3KNz/4gnW
	yjfITA0+EaoWzfGN5Ie3SI607q0N3BIHosbrT4xocBoClIj3ouJSE0m43zU6sWuXv4dFt2WjnpOu3
	xqDVrxtFBHt3dcVXh1pEaBdWYwzGDaAIOxWSt2fOe3D+3uvxtMunpyOENBrzWYDA6T8g0lSFyuSeM
	2CkPrkEw==;
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8byo-0000000CB6a-3I6I
	for kvm-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 11:14:40 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc1cea4c7a0so1391150a12.1
        for <kvm-riscv@lists.infradead.org>; Mon, 21 Sep 2026 04:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789989277; x=1790594077; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4xMVi+cD5sodYKE++E9vQWOcZxlG7jO/nwtdaiSfROQ=;
        b=MafiOY1CVUumYcZkxmA0iIs7TvfWcLq1za1xXmkjXfeaxAvJvoWurdM/TyVb/Kptsz
         7cLPI5geLRhwEmm7Adzk1oMTBN0YAZbgX6nNsrkEBqq9h1+F1sine5zwpt7vS/eYeZ0l
         iLYwoI19puRZPDzUNaulVZfYtrhy+LruTP1wdFHQWGAYBRxYaFeeZTHoVNQke7YAcCLE
         TJ8uxSshHitEAJB1pGuqin25EPwn9wNIo1qeyRMOHZyA8VyPsJkJFpeqsSxggne4jIq3
         ocqqyro1Ro5tBOzF0CrvXJtpoHZhmOnabg0Newg9nTzH+Rlvm4UoWVZacIlIrQi0euDz
         tdzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789989277; x=1790594077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4xMVi+cD5sodYKE++E9vQWOcZxlG7jO/nwtdaiSfROQ=;
        b=N6j+8/kPdsA7cTuNhA2KB0eOg2AKaMbmSr4mHxQKKWXEA2Q245Bw3yUDWlZDBQ3NuZ
         9Ua6lcOdHDTNj5vlclmw88ltQZ1ClBCnbcMG8WkTtC4sCzeGL7Za2dMkBwYt0Bn8CGbn
         aOV/fAbxGN3JvB/DI7Qz08CTKKCnRT3CEcS7x/efkB5my7kSitAmbM8UIYA5cxbp1H3u
         91L/TFXnqWVxCROWCzqapctmOLeuQOchUfcSiRnwKnuTrXg1OYJ1Yy3+3nzNkqRqOHeH
         1g4LKkG2WFpaBBToDo0Y+doBqk7NyVu/q7dhi8rwzwtr50uqk0/un7PidaUAVSUtk2uH
         fbRg==
X-Forwarded-Encrypted: i=1; AKwUvBxOF9S/jOOCDsP+aLS9Zbx04SSniX1VutYGcXEqBi3n46bqlvvWEmw6pwTxxp2ZbydvTkfZtx2Neq0=@lists.infradead.org
X-Gm-Message-State: AFuF++n3DfISfmVqxptY9VDFamuZnSgOVT434tEJx7NsSkG0PmtZ0H+b
	P/CWOBb6ySs1YvmArA//arRP8/OXR+bPdfwYCToo5zrpV7UbDkaTHEDg
X-Gm-Gg: AYBFou02aIPwT1MpwbXJEdn2FmTnNvVgK0ScjGrf57TousZjktxOJ5rW2yE33L0YcbE
	q86g8o27pJQwES9YsM2csOYTHsMFaFzu6C4t5wJAqO3SrH+tqidaoKQWe3USuqUe3nbNfppqgRi
	P1Dn4ljCUN+iVbOS+hIThzdViqIMhXzVYG8UZmodYSoL1BLOvnL7G80ptsHkTcDrQYfgXEHvk2I
	nw9hP2gFfiwUcHlC/01MvJt4RojTle6KllM/nt9Ak0H8awxIpdX0ADvPYicBhziAOHe6R4QQoyZ
	mQNzCfCkQdKtxajQnMqWu3xSzYMD789NRx5oaw7phZnxQ2mWz5DjxgMe5bwMZwyUTWE5+99k5uM
	rjJcysqc9jFvuBiPO5K9nE4/sRENDsLNvO3ZHqPuWLCaGeBFsqFe7/NPtGqWhE9pJ6Xm9q9e7Ny
	z73TjgwMJ6fRdlEAnwL7s3xQO+8/VMd79qjZy7C5lTmPzF+Po5bvUyD7xlqqt/XVAh8JdO02fKJ
	ZmoDgyM+a+Jwq3bNnlMig==
X-Received: by 2002:a17:90b:17cc:b0:39e:135e:130e with SMTP id 98e67ed59e1d1-39e54af6a0emr16005396a91.3.1789989276896;
        Mon, 21 Sep 2026 04:14:36 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c6dd585sm13438703a91.0.2026.09.21.04.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:14:36 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jinyu Tang <tjytimi@163.com>,
	Wang Yechao <wang.yechao255@zte.com.cn>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH v1 5/5] KVM: riscv: Age G-stage PTEs locklessly
Date: Mon, 21 Sep 2026 20:14:02 +0900
Message-ID: <20260921111402.120911-6-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260921111402.120911-1-suunj1331@gmail.com>
References: <20260921111402.120911-1-suunj1331@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_121439_325739_BFF2C368 
X-CRM114-Status: GOOD (  12.46  )
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

Aging G-stage PTEs currently runs with mmu_lock held for write, taken
by the common MMU notifier code. When MGLRU or kswapd ages a large
range, every vCPU taking a G-stage fault blocks on the lock, and the
dirty-logging read-side fast path blocks behind aging as well.

The preceding patches prepare G-stage page-table walks for lockless
aging by using consistent PTE snapshots, preserving concurrent
Accessed-bit updates, and deferring page-table frees with RCU.

Select KVM_MMU_LOCKLESS_AGING so the common code no longer takes
mmu_lock for aging, and protect the G-stage walk with an RCU read-side
critical section.

Read the root inside the RCU read-side critical section and check the
resulting snapshot instead of checking kvm->arch.pgd separately before
initializing the G-stage context. This ensures that the root used by
the walk remains protected until the walk completes.

On QEMU TCG with 4 vCPUs, running dirty_log_perf_test -v 3 -b 256M -i 3
with MGLRU aging of the VM's cgroup forced every 100ms (86 passes):

                              before      after
  mmu_lock write wait, total  44.4 s      0.15 s
  mmu_lock write contentions  1,002,092   30,092
  mmu_lock read contentions   351,937     0
  guest dirty-memory time     18.6 s      16.7 s

Before, 93% of write-lock waiters were kvm_mmu_notifier_clear_young().
With no aging, no meaningful difference was observed between the two
kernels.

Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
 arch/riscv/kvm/Kconfig |  1 +
 arch/riscv/kvm/mmu.c   | 26 +++++++++++++-------------
 2 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index ec2cee0a39e0..77898d58ff9a 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -32,6 +32,7 @@ config KVM
 	select VIRT_XFER_TO_GUEST_WORK
 	select SCHED_INFO
 	select GUEST_PERF_EVENTS if PERF_EVENTS
+	select KVM_MMU_LOCKLESS_AGING
 	help
 	  Support hosting virtualized guest machines.
 
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 8aed69abf814..ff282bdbe492 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -349,30 +349,30 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
 	return false;
 }
 
-bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
+static bool kvm_riscv_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range,
+			      bool test_only)
 {
 	struct kvm_gstage gstage;
 
-	if (!kvm->arch.pgd)
-		return false;
+	guard(rcu)();
+	lockdep_assert_not_held(&kvm->mmu_lock);
 
 	kvm_riscv_gstage_init(&gstage, kvm);
+	if (!gstage.pgd)
+		return false;
 
 	return kvm_riscv_gstage_age_range(&gstage, range->start << PAGE_SHIFT,
-					  range->end << PAGE_SHIFT, false);
+					  range->end << PAGE_SHIFT, test_only);
 }
 
-bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
+bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
-	struct kvm_gstage gstage;
-
-	if (!kvm->arch.pgd)
-		return false;
-
-	kvm_riscv_gstage_init(&gstage, kvm);
+	return kvm_riscv_age_gfn(kvm, range, false);
+}
 
-	return kvm_riscv_gstage_age_range(&gstage, range->start << PAGE_SHIFT,
-					  range->end << PAGE_SHIFT, true);
+bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
+{
+	return kvm_riscv_age_gfn(kvm, range, true);
 }
 
 static bool fault_supports_gstage_huge_mapping(struct kvm_memory_slot *memslot,
-- 
2.52.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
